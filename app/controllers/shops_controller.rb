class ShopsController < ApplicationController
  def index
    @shops = shops
  end
end
