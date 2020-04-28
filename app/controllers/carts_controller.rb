class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :update]
  def show
    @cart = current_or_guest_user.cart
    @box = @cart.box
    @products = @cart.products

    authorize @cart
  end

  def update
    @cart = current_or_guest_user.cart
    @cart.update(cart_params)
    if cart_params[:box_id] == ""
    redirect_to boxes_path
    else
      redirect_to products_path
    end

    authorize @cart
  end

  private

  def cart_params
    params.require(:cart).permit(:box_id)
  end
end
