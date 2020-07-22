class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.find_by(:email => params[:customer][:email])
        if @customer.valid?
            @customer = Customer.create(customer_params)
            session[:customer_id] = @customer.id
            render :'/customers/new'
        elsif 
            render :'/customers/new'
        end
    end

    def show
        @customer = Customer.find_by(:id => params[:id])
    end

    def edit
        @customer = Customer.find_by(:id => params[:id])
    end

    def update
        @customer = Customer.find_by(:id => params[:id])
        @customer.update(customer_params)
        redirect_to @customer
    end

    private

    def customer_params
        params.require(:customer).permit(:email, :password, :name, :cash)
    end
end