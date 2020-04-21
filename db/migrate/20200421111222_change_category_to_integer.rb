class ChangeCategoryToInteger < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category, :integer
    remove_column :boxes, :category, :string
    add_column :boxes, :category, :integer
  end
end
