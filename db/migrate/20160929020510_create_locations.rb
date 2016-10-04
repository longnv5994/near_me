class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :place_name
      t.string :city
      t.string :country
      t.float :lat
      t.float :long
      t.string :street
      t.string :zip

      t.timestamps
    end
  end
end
