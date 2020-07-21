class AddImageToIndoorPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :indoor_plants, :image, :string
  end
end
