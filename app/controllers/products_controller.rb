class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = policy_scope(Product)
    @cart_product = CartProduct.new
  end


  def new
    # only admin can create a product
    # if you are admin, then you can create a product
    # otherwise, you cannot
     @product = Product.new
     authorize @product
  end

  def create
    # only admin can create a product
    # if you are admin, then you can create a product
    # otherwise, you cannot
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product is created.'
    else
      render :new
    end
  end


  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :category, :photo)
  end

end
