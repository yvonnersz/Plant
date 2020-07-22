class Store < ApplicationRecord
    validates :name, uniqueness: true
    
    has_many :indoor_plants
    belongs_to :customer

    def plants_sold
        x = []

        Customer.all.each do |customer|
            customer.indoor_plants.collect {|plant| x << plant.store_id if plant.store_id == self.id}
        end

        x.count
    end

end
