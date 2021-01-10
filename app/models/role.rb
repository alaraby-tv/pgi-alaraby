class Role < ApplicationRecord
  has_many :users

  validates :name, presence: true

  def self.collection_depent_on(user)
    user.admin? ? all : where.not(name: 'superuser')
  end

  def capitalaized_name
    name.capitalize
  end
end
