class Box < ApplicationRecord
  has_many :orders
  has_many :carts

  enum category: CATEGORIES
end
