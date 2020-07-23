class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif 
            render :'/users/new'
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
    end

    def edit
        @user = User.find_by(:id => params[:id])
    end

    def update
        @user = User.find_by(:id => params[:id])
        @user.update(user_params)
        
        if @user.valid?
            redirect_to @user
        else
            render :'/users/edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :cash)
    end
    
end