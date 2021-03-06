class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  skip_after_action :verify_authorized, only: [:show]
  def create
    order = Order.create!(
      user_id: current_or_guest_user.id,
      delivery_status: 0,
      amount_cents: current_or_guest_user.cart.get_total_price,
      box_id: current_or_guest_user.cart.box_id
    )
    order.products = current_or_guest_user.cart.products

    redirect_to new_order_payment_path(order)
    authorize order
  end

  def show
    begin
      @order = policy_scope(Order).find(params[:id])
      authorize @order
    rescue ActiveRecord::RecordNotFound
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end
end
