class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @box = @cart.box
    @products = @cart.products
  end

  def update
    @cart = current_user.cart
    @cart.update(cart_params)
    if cart_params[:box_id] == ""
    redirect_to boxes_path
    else
      redirect_to products_path
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:box_id)
  end
end
