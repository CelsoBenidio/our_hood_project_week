class RemoveArrayVisitFrequency < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :visit_frequency, :string
    add_column :preferences, :visit_frequency, :string
  end
end
