class SessionsController < ApplicationController

    def new
        @customer = Customer.new
        render '/login'
    end

    def create
        if @customer = Customer.find_by(:email => params[:customer][:email])
            @customer.authenticate(:password => params[:customer][:password])
            session[:customer_id] = @customer.id
            redirect_to @customer
        else
            flash[:message] = "Invalid username and password. Please try again."
            redirect_to '/login'
        end
    end

    def fbcreate
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid'] #secure random hex
        end
        session[:customer_id] = @customer.id
        redirect_to edit_customer_path(@customer)
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end

end
