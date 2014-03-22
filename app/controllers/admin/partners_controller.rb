class Admin::PartnersController < Admin::BaseController

	def index
		@partners = Partner.all
	end

	def new
		@partner = Partner.new
	end

	def create
		@partner = Partner.new(partner_params)
		if @partner.save
			flash[:notice] = "Create new partners."
			redirect_to admin_partners_path
		else
			flash[:alert] = "Error on creating partners."
			render :action => 'new'
		end
	end

	def show
		@partner = Partner.find(params[:id])
	end

	def edit
		@partner = Partner.find(params[:id])
	end

	def update
		@partner = Partner.find(params[:id])
		if @partner.update(partner_params)
			flash[:notice] = "Update partner."
			redirect_to admin_partners_path		
		else
			flash[:alert] = "Error on creating partners."
			render :action => 'edit'
		end
	end

	private
		def partner_params
			params.require(:partner).permit(:name, :details)
		end
end