class CustomersController < ApplicationController
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.valid?
            @customer.save
            session[:customer_id] = @customer.id
            redirect_to customer_path(@customer)
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