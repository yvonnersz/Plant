class CreateIndoorPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :indoor_plants do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
