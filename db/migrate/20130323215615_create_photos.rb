class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :description
      t.decimal :lat, precision: 10, scale: 6  
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
