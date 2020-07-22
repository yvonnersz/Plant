class Customer < ApplicationRecord
    validates :email, uniqueness: true
    validates :cash, numericality: { greater_than_or_equal_to: 0 }
    has_secure_password

    has_many :customer_indoor_plants
    has_many :indoor_plants, through: :customer_indoor_plants
    has_many :stores
end
