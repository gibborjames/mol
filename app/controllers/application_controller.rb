  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def authorize_admin!
  		authenticate_user!
  		unless current_user.admin?
  			flash[:notice] = "You must be admin to do that."
  			redirect_to root_path
  		end
  	end
end
