class ApplicationController < ActionController::Base

    def welcome
        render '/welcome'
    end

    helpers do
        def current_customer
            @current_customer ||= Customer.find_by(:id => session[:customer_id])
        end

        def logged_in?
            !!current_customer
        end
    end
            
end
