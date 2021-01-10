class Attachment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :marketing_material, counter_cache: true

  mount_uploader :file_attached, AttachmentUploader
  # store_in_background :file_attached
  validate :file_size_validation
  validates :file_attached, :marketing_material, presence: true


  def set_success(format, opts)
    self.success = true
  end

  private

  def file_size_validation
    errors[:attachment] << "should be less than 250MB" if file_attached.size > 250.megabytes
  end
end
