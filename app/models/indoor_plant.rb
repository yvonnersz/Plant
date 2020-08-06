class IndoorPlant < ApplicationRecord
  include ApplicationHelper
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :store
  has_many :user_indoor_plants
  has_many :users, through: :user_indoor_plants

  def buy(current_user)
    if self.price <= current_user.cash
      current_user.indoor_plants << self

      current_user.update(:cash => current_user.cash - self.price)
      store.income = (store.income.nil? ? 0:store.income)
      self.store.update(:income => store.income + self.price)
    end
  end

  def self.by_price(num1, num2)
    where("price BETWEEN ? AND ?", num1, num2)
  end
 
end
