class CreateCustomerIndoorPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_indoor_plants do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :indoor_plant, null: false, foreign_key: true
    end
  end
end
