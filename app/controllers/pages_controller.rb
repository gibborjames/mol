class PagesController < ApplicationController

	def index
		flash[:alert] = "Please Login"
	end

	def help
		
	end
end
