class Store < ApplicationRecord
    validates :name, uniqueness: true
    
    belongs_to :user
    has_many :indoor_plants

    def plants_sold
        @x = []

        User.all.each do |user|
            user.indoor_plants.collect {|plant| @x << plant if plant.store_id == self.id}
        end

        @x
    end

    def most_sold_plant
        grouped_array = @x.group_by(&:itself)
        key, value = grouped_array.first
        best_selling_hash = grouped_array.map {|key, value| [key.name, value.length]}.to_h
        inverted_hash = best_selling_hash.sort_by {|key, value| -value}.to_h
        inverted_hash.keys[0]
    end
end
