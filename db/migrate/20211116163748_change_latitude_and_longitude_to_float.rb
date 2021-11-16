class ChangeLatitudeAndLongitudeToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :latitude, :float
    change_column :properties, :longitude, :float
  end
end
