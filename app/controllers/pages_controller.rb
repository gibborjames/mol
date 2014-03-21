class PagesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		flash[:alert] = "Please Login"
	end

	def help
		
	end
end
