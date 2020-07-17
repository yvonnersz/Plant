class AddCustomerRefToStores < ActiveRecord::Migration[6.0]
  def change
    add_reference :stores, :customer, null: false, foreign_key: true
  end
end
