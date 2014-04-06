class PartnersController < ApplicationController

	def show
		@partners = Partner.all
		@partner = Partner.find(params[:id])
		@items = @partner.items
		@file_upload = @partner.file_uploads.build
	end
end
