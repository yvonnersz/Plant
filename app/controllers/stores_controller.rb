class StoresController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def index
<<<<<<< HEAD
        if params[:user_id]
            @stores = User.find_by(:id => params[:user_id]).stores
=======
        if params[:user]
            @stores = User.find_by(:id => params[:user]).stores
>>>>>>> 1893d1bb76e2ba56ad2f103d33779647a8a4764a
        else
            @stores = Store.all
        end
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
<<<<<<< HEAD
        @store.user_id = session[:user_id]
=======
        @store.user = session[:user]
>>>>>>> 1893d1bb76e2ba56ad2f103d33779647a8a4764a

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

        if @store.valid?
            redirect_to store_path(@store)
        else
            render :'/stores/new'
        end
    end

    def destroy
        @store = Store.find_by(:id => params[:id])
        @store.indoor_plants.each {|plant| plant.destroy}
        @store.destroy
        redirect_to stores_path
    end

    private

    def store_params
        params.require(:store).permit(:name, :bio, :store_id)
    end

end