class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end