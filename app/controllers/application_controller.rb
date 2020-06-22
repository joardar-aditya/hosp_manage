class ApplicationController < ActionController::Base
    protect_from_forgery 
    add_flash_types :danger , :success

    private 
    def current_user 
        @current_user ||= User.find(session[:id]) if session[:id]
    end
    helper_method :current_user

    private
    def current_admin
      @current_admin ||= Admin.find(session[:id]) if session[:id]
    end
    helper_method :current_admin
end
