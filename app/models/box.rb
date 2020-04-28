class Box < ApplicationRecord
  has_many :orders
  has_many :carts
  monetize :price_cents
  enum category: CATEGORIES
end
