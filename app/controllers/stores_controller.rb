class StoresController < ApplicationController

    def new
        @store = Store.new
    end

    def create
        @store = Store.create(store_params)
        redirect_to @store
    end

    def show
    end

    private

    def store_params
        params.require(:store).permit(:name, :prestige)
    end

end