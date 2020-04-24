class OrdersController < ApplicationController
  def create
    order = Order.create!(
      user_id: current_user.id,
      delivery_status: 0,
      amount_cents: current_user.cart.get_total_price
    )

    order.products = current_user.cart.products

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: current_user.cart.products.map{|p| { name: p.name, amount: order.amount_cents, currency: 'try', quantity: 1 } },
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end
end
