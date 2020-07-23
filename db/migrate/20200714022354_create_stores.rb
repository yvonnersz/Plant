class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :bio
      t.integer :income
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
