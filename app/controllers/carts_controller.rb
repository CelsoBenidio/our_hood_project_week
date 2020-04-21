class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @box = @cart.box
    @products = @cart.products
  end

  private

  def show_params
    params.require(:cart).permit(:user_id, :box_id)
  end
end
