class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  enum category: CATEGORIES
end
