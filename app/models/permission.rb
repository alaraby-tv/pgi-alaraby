class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :product

  paginates_per(50)

  validates_presence_of :user_id, :product_id
  validates_uniqueness_of :user_id, :scope => :product_id
end
