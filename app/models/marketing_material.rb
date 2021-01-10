class MarketingMaterial < ApplicationRecord
  has_many :attachments, dependent: :delete_all
  belongs_to :marketable, polymorphic: true
  belongs_to :material_type

  paginates_per(50)

  def any_attachments?
    attachments.any?
  end
end
