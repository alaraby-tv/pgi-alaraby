class ProductionCompany < ApplicationRecord
  has_many :products
  has_many :episodes
end
