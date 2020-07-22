class Store < ApplicationRecord
    validates :name, uniqueness: true
    
    has_many :indoor_plants
    belongs_to :customer

    def plants_sold
        @x = []

        Customer.all.each do |customer|
            customer.indoor_plants.collect {|plant| @x << plant if plant.store_id == self.id}
        end

        @x.count
    end

    def most_sold_plant
        h = @x.group_by(&:itself)
        k, v = h.first
        y = h.map {|k, v| [k.name, v.length]}.to_h
        z = y.sort_by {|k, v| -v}.to_h
        z.keys[0]
    end

end
