class AddForeignKeyToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :box, null: false, foreign_key: true
    remove_column :boxes, :order_id, :bigint
  end
end
