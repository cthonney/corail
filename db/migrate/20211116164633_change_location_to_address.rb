class ChangeLocationToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :location, :address
  end
end
