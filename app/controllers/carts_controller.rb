class CartsController < ApplicationController
  def update
    @cart = current_user.cart
    @cart.update(cart_params)
    redirect_to root_path
  end

  def show
  end

  def cart_params
    params.require(:cart).permit(:box_id)
  end
end
