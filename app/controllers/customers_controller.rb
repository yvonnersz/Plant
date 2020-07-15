class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:customer_id] = @customer.id
            redirect_to @customer
        end
    end

    def show
        @customer = Customer.find_by(:id => params[:id])
    end

    private

    def customer_params
        params.require(:customer).permit(:email, :password, :name, :cash)
    end
end