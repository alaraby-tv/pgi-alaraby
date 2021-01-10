class ViewingForm < ApplicationRecord
  belongs_to :viewable, polymorphic: true
  belongs_to :user
  has_many :parts, dependent: :destroy
  accepts_nested_attributes_for :parts, allow_destroy: :true, reject_if: proc { |a| a[:duration].blank? }

  mount_uploader :attachment, AttachmentUploader
end
