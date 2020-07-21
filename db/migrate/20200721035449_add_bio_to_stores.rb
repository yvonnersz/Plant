class AddBioToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :bio, :string
  end
end
