class CartProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @product = Product.find(cart_product_params[:product_id])
    @cart = current_or_guest_user.cart

    @cart_product = CartProduct.create(product: @product, cart: @cart)
    authorize @cart_product
    redirect_to products_path
  end

  def destroy
    # /cart_products/1 -> 1 is the id of CartProduct
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    @cart_product.destroy
    redirect_back(fallback_location: products_path)

  end

  def cart_product_params
    params.require(:cart_product).permit(:product_id)
  end
end
