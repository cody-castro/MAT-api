class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :location_category
      t.boolean :ada
      t.string :ada_type

      t.timestamps
    end
  end
end
