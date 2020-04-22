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

  def default_picture
    'https://res.cloudinary.com/drjk0oilg/image/upload/v1587560865/insert-image_kaj4ea.png'
  end
end
