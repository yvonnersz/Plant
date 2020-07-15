class Customer < ApplicationRecord
    has_many :customer_indoor_plants
    has_many :indoor_plants, through: :customer_indoor_plants
    has_many :stores, through: :indoor_plants
    has_secure_password
end
