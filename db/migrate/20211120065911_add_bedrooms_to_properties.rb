class AddBedroomsToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :bedrooms, :integer
  end
end
