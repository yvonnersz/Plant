class IndoorPlant < ApplicationRecord
  belongs_to :store
  has_many :customer_indoor_plants
  has_many :customers, through: :customer_indoor_plants
 
  def enough_cash?
    self.price <= self.customer.cash ? true:"You do not have enough cash."
  end

  def buy
    cash_update = self.customer.cash - self.price
    self.customer.update(
        :cash => cash_update)
      "Thanks!"
  end

end
