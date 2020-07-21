class IndoorPlantsController < ApplicationController

    def index
        if params[:customer_id]
            @indoor_plants = Customer.find(params[:customer_id]).indoor_plants
        else
            @indoor_plants = IndoorPlant.all
        end
    end

    def new
        @indoor_plant = IndoorPlant.new(:store_id => params[:store_id])
    end

    def create
        @indoor_plant = IndoorPlant.create(indoor_plants_params)
        redirect_to @indoor_plant
    end

    def show
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
    end

    def buy
        customer = Customer.find_by(:id => session[:customer_id])
        indoor_plant = IndoorPlant.find_by(:id => params[:id])
        
        customer.update(:cash => customer.cash - indoor_plant.price)
        customer.indoor_plants << indoor_plant

        redirect_to customer_path(customer)
    end

    private

    def indoor_plants_params
        params.require(:indoor_plant).permit(:name, :price, :store_id, :image, customer_ids: [])
    end

end
