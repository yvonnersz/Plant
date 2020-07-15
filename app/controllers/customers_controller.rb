class CustomersController < ApplicationController
    def new
        @customer = Customer.new
    end

    def create
        if @customer = Customer.find_by(:email => params[:email])
            flash[:message] = "This email has already been used."
        else
            @customer = Customer.create(customer_params)
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