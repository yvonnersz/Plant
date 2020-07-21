class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def new
        @customer = Customer.new
    end

    def create
        if @customer = Customer.find_by(:email => params[:customer][:email])
            flash[:message] = "An account has been made with this email. Please login."
            redirect_to '/login'
        elsif @customer = Customer.new(customer_params)
            @customer.save
            session[:customer_id] = @customer.id
            redirect_to @customer
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
        @customer.update(:cash => params[:cash])
        redirect_to @customer
    end

    private

    def customer_params
        params.require(:customer).permit(:email, :password, :name, :cash)
    end
end