class AddOptionalBoxToOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :box
    add_reference :orders, :box, foreign_key: true
  end
end
