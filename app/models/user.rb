class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :cash, numericality: { greater_than_or_equal_to: 0 }
    has_secure_password

    has_many :stores
    has_many :user_indoor_plants
    has_many :indoor_plants, through: :user_indoor_plants
end
