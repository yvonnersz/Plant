class IndoorPlantsController < ApplicationController

    def new
        @indoor_plant = IndoorPlant.new
    end

    def create
        @indoor_plant = IndoorPlant.create(indoor_plants_params)
        redirect_to @indoor_plant
    end

    def show
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
    end

    private

    def indoor_plants_params
        params.require(:indoor_plant).permit(:name, :price, :store_id, customer_ids: [])
    end

end
