class Customer < ApplicationRecord
    has_many :indoor_plants
    has_many :stores, through: :indoor_plants
end
