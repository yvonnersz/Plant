class SessionsController < ApplicationController

    def new
        @customer = Customer.new
        render '/login'
    end

    def create
        @customer = Customer.find_by(:email => params[:customer][:email])
        if @customer
            @customer.authenticate(params[:customer][:password])
        end

        session[:customer_id] = @customer.id
        redirect_to @customer
    end

    def fbcreate
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end

        session[:customer_id] = @customer.id
        redirect_to @customer
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
