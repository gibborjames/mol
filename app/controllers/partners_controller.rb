class PartnersController < ApplicationController

	def show
		@partners = Partner.all
		@partner = Partner.find(params[:id])
		@file_upload = @partner.file_uploads.build
	end
end
