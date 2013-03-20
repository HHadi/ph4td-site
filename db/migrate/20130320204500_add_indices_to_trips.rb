class AddIndicesToTrips < ActiveRecord::Migration
  def change
    add_index :trips, [:user_id, :created_at ]
  end
end
