class IndoorPlant < ApplicationRecord
  include ApplicationHelper

  belongs_to :store
  has_many :customer_indoor_plants
  has_many :customers, through: :customer_indoor_plants

  def buy(current_customer)
    if self.price <= current_customer.cash
      current_customer.indoor_plants << self

      current_customer.update(:cash => current_customer.cash - self.price)
      store.income = (store.income.nil? ? 0:store.income)
      self.store.update(:income => store.income + self.price)
    end
  end
 
end
