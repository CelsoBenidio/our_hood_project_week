class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @box = @cart.box
    @products = @cart.products
  end

  def update
    @cart = current_user.cart
    @cart.update(cart_params)
    redirect_to root_path
  end

private

  def cart_params
    params.require(:cart).permit(:box_id)
  end
end
