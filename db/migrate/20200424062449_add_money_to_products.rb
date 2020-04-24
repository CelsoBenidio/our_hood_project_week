class AddMoneyToProducts < ActiveRecord::Migration[6.0]
  def change
    # get rid of the previous price column
    remove_column :products, :price, :integer

    # add the new money-rails price column
    # add_column :products, :price, :monetize
    add_monetize :products, :price, currency: { present: false }
  end
end
