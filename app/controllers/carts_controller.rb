class CartsController < ApplicationController

  def show
    @cart = current_order.order_items
  end
end
