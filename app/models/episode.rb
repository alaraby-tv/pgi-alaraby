class Episode < ApplicationRecord
  before_save :find_or_create_guest
  before_save :titleize_english_title

  belongs_to :product
  belongs_to :user
  belongs_to :production_company, optional: true
  has_one :viewing_form, as: :viewable
  has_many :events, as: :attainable
  has_many :presenters, through: :events
  has_many :guests, through: :events
  has_many :marketing_materials, as: :marketable, dependent: :destroy

  validates :english_title, :arabic_title, presence: true
  
  accepts_nested_attributes_for :guests, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true

  paginates_per(50)

  def production_company_name
    production_company.try(:name)
  end

  def production_company_name=(name)
    self.production_company = ProductionCompany.find_by_name(name) if name.present?
  end

  private

  def titleize_english_title
    self.english_title = english_title.titleize
  end

  def find_or_create_guest
    self.guests = self.guests.map do |guest|
      Guest.find_or_create_by(name: guest.name)
    end
  end
end