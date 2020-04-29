class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :box, optional: true

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def get_total_price
    total = 0
    self.products.each do |product|
      total = total + product.price_cents
    end
    if self.box
      total + self.box.price_cents
    else
      total
    end
  end
end

