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
        h = @x.group_by(&:itself)
        k, v = h.first
        y = h.map {|k, v| [k.name, v.length]}.to_h
        z = y.sort_by {|k, v| -v}.to_h
        z.keys[0]
    end

    def self.by_user(user_id)
        where(user: user_id)
    end

end
