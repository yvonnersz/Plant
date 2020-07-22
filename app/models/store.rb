class Store < ApplicationRecord
    validates :name, uniqueness: true
    
    has_many :indoor_plants
    belongs_to :customer
end
