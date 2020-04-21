class AddColumnsToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :age, :integer
    add_column :preferences, :gender, :string
  end
end
