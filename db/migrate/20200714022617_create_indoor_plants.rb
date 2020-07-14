class CreateIndoorPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :indoor_plants do |t|
      t.string :name
      t.integer :price
      t.belongs_to :store, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
