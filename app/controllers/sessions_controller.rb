class SessionsController < ApplicationController

    def new
        @customer = Customer.new
        render '/login'
    end

    def create
        @customer = Customer.find_by(:email => params[:customer][:email])
        if @customer && @customer.authenticate(params[:customer][:password])
            session[:customer_id] = @customer.id
            redirect_to @customer
        else
            flash[:error] = "Incorrect login."
            redirect_to '/login'
        end
    end

    def destroy
    end

end
