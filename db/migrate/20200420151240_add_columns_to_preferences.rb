class AddColumnsToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :name, :string
    add_column :preferences, :age, :string
    add_column :preferences, :gender, :string
    add_column :preferences, :favorite_product, :string
    add_column :preferences, :visit_frequency, :string
    add_column :preferences, :issue, :string
    add_column :preferences, :needed_product, :string
  end
end
