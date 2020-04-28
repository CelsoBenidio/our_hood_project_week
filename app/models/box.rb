class Box < ApplicationRecord
  has_many :orders
  has_many :carts


  before_destroy :check_dependents
  monetize :price_cents
  enum category: CATEGORIES


  private

  def check_dependents
    if orders.count > 0
      orders.each {|order| order.update box_id: nil}
    end
    if carts.count > 0
      carts.each {|cart| cart.update box_id: nil}
    end
  end
end
