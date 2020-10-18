class AddLongLatToLocations < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'postgis'
    add_column :locations, :coordinates, :point
    add_column :locations, :line, :string
  end
end
