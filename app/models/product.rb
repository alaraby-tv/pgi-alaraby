class Product < ApplicationRecord
  before_save :find_or_create_guest
  before_save :find_or_create_presenter

  cattr_accessor :form_steps do
    %w(add_type add_marketing_details add_guests_and_presenters add_details)
  end
  attr_accessor :form_step
  attr_reader :author_tokens

  mount_uploader :logo, AttachmentUploader

  paginates_per(50)

  belongs_to :user
  belongs_to :product_type
  belongs_to :duration, optional: true
  belongs_to :broadcasting_frequency, optional: true
  belongs_to :production_company, optional: true
  belongs_to :nature
  belongs_to :category
  belongs_to :genre
  belongs_to :department
  has_one :viewing_form, as: :viewable
  has_many :events, as: :attainable
  has_many :presenters, through: :events
  has_many :guests, through: :events
  has_many :marketing_materials, as: :marketable, dependent: :destroy
  has_many :episodes
  has_many :permissions
  has_many :permited_users, through: :permissions, source: :user
  has_and_belongs_to_many :ages
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :educations
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :broadcast_media

  accepts_nested_attributes_for :guests, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :presenters, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true

  validates :product_type, :nature, :category, :genre, :broadcast_media, presence: true, if: :active_or_add_type?
  validates :ages, :regions, :educations, :genders, presence: true, if: :active_or_add_marketing_details?
  validates :english_title, :arabic_title, :full_description, presence: true, if: :active_or_add_details?

  def self.active_products
    where(status: 'active')
  end

  def active?
    status == 'active'
  end

  def active_or_add_type?
    status.include?('add_type') || active?
  end

  def active_or_add_marketing_details?
    status.include?('add_marketing_details') || active?
  end

  def active_or_add_details?
    status.include?('add_details') || active?
  end

  def add_marketing_materials
    image = MaterialType.find_by_name('image')
    audio = MaterialType.find_by_name('audio')
    video = MaterialType.find_by_name('video')
    document = MaterialType.find_by_name('document')
    marketing_materials.create([
      { name: 'High resolution logo', material_type: image },
      { name: 'High resolution images', material_type: image },
      { name: 'High resolution images of presenter(s)', material_type: image },
      { name: 'High resolution promo posters with logo', material_type: image },
      { name: 'Music of the program', material_type: audio },
      { name: 'Promo', material_type: video },
      { name: 'Pilot', material_type: video },
      { name: 'Press release for PR agency', material_type: document },
      { name: 'Rushes and unused BTS footage', material_type: video }
    ])
  end

  def production_company_name
    production_company.try(:name)
  end

  def production_company_name=(name)
    self.production_company = ProductionCompany.find_by_name(name) if name.present?
  end


  def single_product?
    product_type.sort == 'Single product'
  end


  def any_episodes?
    episodes.any?
  end

  def titleize_english_title
    english_title.titleize
  end

  def send_an_email
    if active?
      ProductMailer.email_on_update(self).deliver_now
    else
      ProductMailer.email_on_creation(self).deliver_now
    end
  end

  private

  def find_or_create_guest
    self.guests = self.guests.map do |guest|
      Guest.find_or_create_by(name: guest.name)
    end
  end

  def find_or_create_presenter
    self.presenters = self.presenters.map do |presenter|
      Presenter.find_or_create_by(name: presenter.name)
    end
  end
end

