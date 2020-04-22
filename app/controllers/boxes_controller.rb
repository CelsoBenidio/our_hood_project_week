class BoxesController < ApplicationController
  def index
    @boxes = Box.all
    @cart = current_user.cart
  end
end
