class OrdersController < ApplicationController
  skip_after_action :verify_authorized, only: [:show]
  def create
    order = Order.create!(
      user_id: current_user.id,
      delivery_status: 0,
      amount_cents: current_user.cart.get_total_price,
      box_id: current_user.cart.box_id
    )

    order.products = current_user.cart.products

    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: current_user.cart.products.map{|p| { name: p.name, amount: order.amount_cents, currency: 'try', quantity: 1 } },
    #   success_url: order_url(order),
    #   cancel_url: order_url(order)
    # )

    # order.update(checkout_session_id: session.id)

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
