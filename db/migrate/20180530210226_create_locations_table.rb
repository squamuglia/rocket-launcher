class CreateLocationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :location_id
      t.string :country_code
    end
  end
end
