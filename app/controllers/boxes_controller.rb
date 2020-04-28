class BoxesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

  def index
    # atm we're loading all the boxes
    # @boxes = Box.all
    # in the final product, we need to load the boxes
    # where box.category === user.preference.category
    # categories = current_user.preference.favorite_product
    # categories.shift # equal to ["clothing", "electronics"]

    @boxes = policy_scope(Box)

    # @boxes = Box.where(category: categories)
    # check if box.category is included in current_user.preference.favorite_product

    # current situation
    # Box 1 -> category = gift cards
    # Box 2 -> category = clothing
    # Box 3 -> category = electronics

    # Is Box1.category included in ["clothing", "electronics"] -> False
    # Is Box2.category included in ["clothing", "electronics"] -> True
    # Is Box3.category included in ["clothing", "electronics"] -> True

    # result -> Box2 and Box3
    @cart = current_or_guest_user.cart

  end
end
