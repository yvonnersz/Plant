class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :name
      t.integer :cash

      t.timestamps
    end
  end
end
