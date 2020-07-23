class CreateUserIndoorPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :user_indoor_plants do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :indoor_plant, null: false, foreign_key: true
    end
  end
end
