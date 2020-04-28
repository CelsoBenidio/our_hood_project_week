class AddStripeApiToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :stripe_api_id, :string
  end
end
