class IndoorPlant < ApplicationRecord
  belongs_to :store
  has_many :customer_indoor_plants
  has_many :customers, through: :customer_indoor_plants
 


end
