class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  	def authenticate_user!
  		unless user_logged_in?
        flash[:notice] = "Please log in or sign up first"
        redirect_to new_login_path 
  		end
  	end
end

