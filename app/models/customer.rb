class Customer < ApplicationRecord
    has_many :plants
    has_many :stores, through: :plants
end
