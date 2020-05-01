class Box < ApplicationRecord
  has_many :orders
  has_many :carts

  before_destroy :check_dependents
  monetize :price_cents
  enum category: CATEGORIES

  def quantity
    if self.stripe_api_id == 'basic_plan'
      3
    elsif self.stripe_api_id == 'premium_plan'
      4
    else
      5
    end
  end

  def formatted_description(preference)
    "With this plan you will receive a surprise box containing #{self.quantity} tailored #{preference&.stringify_categories} items, among others."
  end

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
