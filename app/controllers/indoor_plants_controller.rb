class IndoorPlantsController < ApplicationController

    def new
        @indoor_plant = IndoorPlant.new
    end

    def create
        @indoor_plant = IndoorPlant.new
        redirect_to @indoor_plant
    end

    def show
    end

end
