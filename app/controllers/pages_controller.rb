class PagesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		
	end

	def help
		
	end
end
