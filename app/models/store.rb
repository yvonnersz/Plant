class Store < ApplicationRecord
    has_many :plants
    has_many :customers, through: :plants
end
