class Customer < ApplicationRecord
    validates :name, :email, presence: true
    validates :name, :email, uniqueness: true
    validates :cash, numericality: { greater_than: 0 }

    has_many :customer_indoor_plants
    has_many :indoor_plants, through: :customer_indoor_plants
    has_secure_password
    has_many :stores
end
