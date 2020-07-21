class Store < ApplicationRecord
    has_many :indoor_plants
    belongs_to :customer
    @@income = []

    def income
        @@income << self
    end
end
