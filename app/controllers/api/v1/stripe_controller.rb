class Api::V1::StripeController < Api::V1::BaseController

  def create_a_customer
    begin
      order = Order.find(params[:order_id])
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create(
          payment_method: params[:payment_method],
          email: params[:email],
          invoice_settings: {
            default_payment_method: params[:payment_method],
          },
        )
      else
        customer = Stripe::Customer.retrieve(current_user.stripe_id)
      end
      subscription = Stripe::Subscription.create(
        customer: customer.id,
        items: [
          {
            plan: order.box.stripe_api_id || 'basic_plan',
          },
        ]
      )

      Stripe::InvoiceItem.create({
        customer: customer.id,
        amount: order.get_products_price,
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

      order.update status: 'paid', delivery_address: params[:delivery_address], delivery_contact_number: params[:delivery_contact_number]

      order.user.cart.products.destroy_all
      order.user.cart.update box_id: nil

      render json: order
    rescue Stripe::CardError => e
      render json: {error:{code:e.http_status, message: e.error.message}}
    end
  end
end

# add a new stripe_api_id to the boxes table
# manually change this id to basic_plan
# in this file when creating the subscription use the stripe_api_id of the box added to the order
# order.user.cart.box.stripe_api_id
