class Store < ApplicationRecord
    has_many :indoor_plants
    has_many :customers, through: :indoor_plants
end
