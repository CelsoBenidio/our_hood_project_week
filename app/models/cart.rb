class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :box, optional: true
  has_many :cart_products
  has_many :products, through: :cart_products
end
