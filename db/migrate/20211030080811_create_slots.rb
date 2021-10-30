class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.datetime :date
      t.integer :max_visitor
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
