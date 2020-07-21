class ApplicationController < ActionController::Base

    def welcome
        render '/welcome'
    end

    def about
        render '/about'
    end
     
end
