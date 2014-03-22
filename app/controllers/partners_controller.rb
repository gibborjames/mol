class PartnersController < ApplicationController

	def show
		@partners = Partner.all
		@partner = Partner.find(params[:id])
	end
end