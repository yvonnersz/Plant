class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :income
      t.integer :prestige

      t.timestamps
    end
  end
end
