class PagesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		@partners = Partner.all
		if current_user.admin?
			redirect_to admin_root_path
		end
	end

	def help
		@partners = Partner.all
	end
end
