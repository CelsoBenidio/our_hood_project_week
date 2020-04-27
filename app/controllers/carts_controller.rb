class CartsController < ApplicationController

  def show
    #Only current user can see his/her cart
    @cart = current_user.cart
    @box = @cart.box
    @products = @cart.products

    authorize @cart
  end

  def update
    #Only current user can update his/her cart
    @cart = current_user.cart
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
