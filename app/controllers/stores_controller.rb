class StoresController < ApplicationController

    def index
        if params[:customer_id]
            @stores = Customer.find_by(:id => params[:customer_id]).stores
        else
            @stores = Store.all
        end
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.create(store_params)
        @store.customer_id = session[:customer_id]
        @store.save
        redirect_to @store
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

    private

    def store_params
        params.require(:store).permit(:name, :prestige, :customer_id, :bio)
    end

end