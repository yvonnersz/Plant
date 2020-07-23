class SessionsController < ApplicationController

    def new
        @customer = Customer.new
        render '/login'
    end

    def create
        if @customer = Customer.find_by(:email => params[:customer][:email])
            if @customer.authenticate(params[:customer][:password])
                session[:customer_id] = @customer.id
                redirect_to customer_path(@customer)
            else
                flash[:message] = "Incorrect password. Please try again."
                redirect_to '/login'
            end
        else
            flash[:message] = "This email does not exist."
            redirect_to '/login'
        end
    end

    def fbcreate
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid'] #secure random hex
            u.cash.nil? ? u.cash = 0 : u.cash = @customer.cash
        end
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
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
