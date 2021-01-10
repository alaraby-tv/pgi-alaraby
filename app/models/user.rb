class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable, :timeoutable

  belongs_to :role
  has_many :products
  has_many :episodes
  has_many :permissions
  has_many :permited_products, through: :permissions, source: :product

  validates :first_name, :last_name, :email, :role_id, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def superuser?
    role.name == 'superuser'
  end

  def producer?
    role.name == 'producer'
  end

  def active_products
    products.active_products
  end

  def self.all_except(user)
    where.not(id: user)
  end
end
