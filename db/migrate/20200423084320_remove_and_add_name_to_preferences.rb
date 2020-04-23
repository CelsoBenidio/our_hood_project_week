class RemoveAndAddNameToPreferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :name, :string
    add_column :preferences, :name, :string
  end
end
