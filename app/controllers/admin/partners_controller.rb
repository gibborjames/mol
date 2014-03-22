class Admin::PartnersController < Admin::BaseController

	def index
		
	end

	def new
		@partner = Partner.new
	end
end