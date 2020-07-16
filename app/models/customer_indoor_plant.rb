class CustomerIndoorPlant < ApplicationRecord
    belongs_to :customer
    belongs_to :indoor_plant
end