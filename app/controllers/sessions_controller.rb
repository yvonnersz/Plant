class SessionsController < ApplicationController

    def new
        @user = User.new
        render '/login'
    end

    def create
        if @user = User.find_by(:email => params[:user][:email])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
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
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid'] #secure random hex
            u.cash.nil? ? u.cash = 0 : u.cash = @user.cash
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
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
