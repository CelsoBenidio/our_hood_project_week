class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'paid')

    order.user.cart.products.destroy_all
    order.user.cart.box.destroy if order.user.cart.box
  end
end
