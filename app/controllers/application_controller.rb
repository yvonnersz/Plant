class ApplicationController < ActionController::Base

    def welcome
        render '/welcome'
    end

    def logged_in?
        session[:customer_id]
    end
    
end
