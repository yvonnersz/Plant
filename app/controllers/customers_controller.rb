class CustomersController < ApplicationController
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
    end

    def show
    end

    private

    def user_params
        params.require(:customer).permit(:email, :password, :name)
    end
end