class AddColumnUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :admin, :boolean, default: false
  end
end
