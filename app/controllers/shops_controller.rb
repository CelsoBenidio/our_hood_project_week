class ShopsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params
    @shop.save
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:store_name, :owner_name, :email, :phone_number, :description)
  end
end