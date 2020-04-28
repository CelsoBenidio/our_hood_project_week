class AddMoneyToBoxes < ActiveRecord::Migration[6.0]
  def change
    remove_column :boxes, :price, :integer
    add_monetize :boxes, :price, currency: { present: false }
  end
end
