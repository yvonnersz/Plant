module ApplicationHelper

    def current_customer
        @current_customer ||= Customer.find_by(:id => session[:customer_id])
    end

    def logged_in?
        !!current_customer
    end

    def require_login
        unless logged_in?
          flash[:message] = "You must be logged in to access this section."
          redirect_to '/login'
        end
    end
    
end
