class Order < ApplicationRecord
  belongs_to :user
  belongs_to :box, optional: true
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  monetize :amount_cents

  def get_products_price
    total = 0
    self.products.each do |product|
      total = total + product.price_cents
    end
    total
  end
  # 1. Add the column -> through the migration
  # 2. Enable monetize on the model
end
