class StoresController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def index
        if params[:store_id]
            @stores = store.find_by(:id => params[:store_id]).stores
        else
            @stores = Store.all
        end
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        @store.customer_id = session[:customer_id]

        if @store.valid?
            @store.save
            redirect_to store_path(@store)
        elsif 
            render :'/stores/new'
        end
        
    end

    def show
        @store = Store.find_by(:id => params[:id])
    end

    def edit
        @store = Store.find_by(:id => params[:id])
    end

    def update
        @store = Store.find_by(:id => params[:id])
        @store.update(store_params)
        redirect_to @store
    end

    def destroy
        @store = Store.find_by(:id => params[:id])
        
        if @store.indoor_plants.empty? == true
            @store.destroy
            redirect_to stores_path
        else
            @store.indoor_plants.each do |plant|
                plant.destroy
            end
            
            @store.destroy
            redirect_to stores_path
        end
    end

    private

    def store_params
        params.require(:store).permit(:name, :prestige, :store_id, :bio)
    end

end