class AttachmentEmail < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  def self.creation
    where(on_creation: true)
  end

  def self.on_destroy
    where(on_delete: true)
  end
end
