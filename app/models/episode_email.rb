class EpisodeEmail < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  def self.creation
    where(on_creation: true)
  end

  def self.updated
    where(on_update: true)
  end
end
