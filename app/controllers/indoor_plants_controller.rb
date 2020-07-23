class IndoorPlantsController < ApplicationController
    include ApplicationHelper
    before_action :require_login
    
    def index
        if params[:user_id]
            @indoor_plants = user.find(params[:user_id]).indoor_plants
        else
            @indoor_plants = IndoorPlant.all
        end
    end

    def new
        @indoor_plant = IndoorPlant.new(:store_id => params[:store_id])
    end

    def create
        @indoor_plant = IndoorPlant.new(indoor_plants_params)
        
        if @indoor_plant.valid?
            @indoor_plant.save
            redirect_to store_path(@indoor_plant.store)
        else
            render :'/indoor_plants/new'
        end
    end

    def show
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
    end

    def edit
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
    end

    def update
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])

        if @indoor_plant.update(indoor_plants_params)
            redirect_to store_path(@indoor_plant.store)
        else
            render '/indoor_plants/edit'
        end
    end

    def destroy
        store = IndoorPlant.find_by(:id => params[:id]).store

        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
        @indoor_plant.destroy

        redirect_to store_path(store)
    end

    def buy
        @indoor_plant = IndoorPlant.find_by(:id => params[:id])
        if @indoor_plant.buy(current_user)
            flash[:message] = "You have successfully bought the plant."
            redirect_to store_path(@indoor_plant.store)
        else
            flash[:message] = "You do not have enough cash."
            redirect_to store_path(@indoor_plant.store)
        end
    end

    private

    def indoor_plants_params
        params.require(:indoor_plant).permit(:name, :price, :image, :store_id, user_ids: [])
    end

end
