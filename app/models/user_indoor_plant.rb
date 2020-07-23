class UserIndoorPlant < ApplicationRecord
    belongs_to :user
    belongs_to :indoor_plant
end