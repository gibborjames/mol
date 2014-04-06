class FileUploadsController < ApplicationController

  def create
    @partner = Partner.find(params[:partner_id])
    binding.pry
    @file_upload = @partner.file_uploads.build(file_params)
    # @file_upload = @partner.file_uploads.build(params[:file_upload])
    if @file_upload.save!
      binding.pry
    else
      binding.pry
    end
    redirect_to @partner
  end

  private
    def file_params
      params.require(:file_upload).permit(:file)
    end
end
