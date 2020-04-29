class AddDeliveryAddressToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivery_address, :string
    add_column :orders, :delivery_contact_number, :string
  end
end
