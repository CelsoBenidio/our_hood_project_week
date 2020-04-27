class RemoveNullFromPreferenceUser < ActiveRecord::Migration[6.0]
  def change
    remove_reference :preferences, :user
    add_reference :preferences, :user

  end
end
