class Order < ApplicationRecord
  belongs_to :user
  belongs_to :box, optional: true
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  monetize :amount_cents

  # 1. Add the column -> through the migration
  # 2. Enable monetize on the model
end
