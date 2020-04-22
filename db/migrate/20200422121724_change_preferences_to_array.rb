class ChangePreferencesToArray < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :favorite_product, :string
    remove_column :preferences, :visit_frequency, :string
    remove_column :preferences, :issue, :string
    remove_column :preferences, :needed_product, :string

    add_column :preferences, :favorite_product, :string, array: true, default: []
    add_column :preferences, :visit_frequency, :string, array: true, default: []
    add_column :preferences, :issue, :string, array: true, default: []
    add_column :preferences, :needed_product, :string, array: true, default: []
  end
end

