class Store < ApplicationRecord
    has_many :indoor_plants
    belongs_to :customer
end
