class Api::V1::StripeController < Api::V1::BaseController

  def create_a_customer
    begin
      order = Order.find(params[:order_id])
      customer = Stripe::Customer.create(
        payment_method: params[:payment_method],
        email: params[:email],
        invoice_settings: {
          default_payment_method: params[:payment_method],
        },
      )
      subscription = Stripe::Subscription.create(
        customer: customer.id,
        items: [
          {
            plan: order.box.stripe_api_id,
          },
        ],
        expand: ['latest_invoice.payment_intent'],
      )

      Stripe::InvoiceItem.create({
        customer: customer.id,
        amount: order.amount_cents,
        currency: 'try',
        description: "Payment for order #{order.id}",
      })

      invoice = Stripe::Invoice.create({
        customer: customer.id,
        collection_method: 'send_invoice',
        days_until_due: 30,
      })
      invoice.send_invoice
      Stripe::Invoice.pay(invoice.id)

      order.update status: 'paid'
      order.user.cart.products.destroy_all
      order.user.cart.update box_id: nil

      render json: order
    rescue
      byebug
    end
  end
end

# add a new stripe_api_id to the boxes table
# manually change this id to basic_plan
# in this file when creating the subscription use the stripe_api_id of the box added to the order
# order.user.cart.box.stripe_api_id
