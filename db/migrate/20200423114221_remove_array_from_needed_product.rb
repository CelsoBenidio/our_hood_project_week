class RemoveArrayFromNeededProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :needed_product, :string
    add_column :preferences, :needed_product, :string
  end
end
