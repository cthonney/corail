class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :type
      t.integer :price
      t.integer :living_space
      t.integer :land_surface
      t.text :location
      t.decimal :latitude
      t.decimal :longitude
      t.integer :parking_space
      t.boolean :pool
      t.integer :room
      t.integer :bathroom
      t.boolean :sea_view
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
