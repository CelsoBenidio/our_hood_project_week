class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :box, optional: true

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def get_products_price
    total = 0
    self.products.each do |product|
      total = total + product.price_cents
    end
    total
  end

  def get_total_price
    self.box.nil? ? self.get_products_price : self.get_products_price + self.box.price_cents
  end
end

