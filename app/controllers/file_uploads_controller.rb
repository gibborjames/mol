class FileUploadsController < ApplicationController

  def create
    @partner = Partner.find(params[:partner_id])
    if params['file_upload'].nil?
      redirect_to @partner, notice: "NO FILE FOUND."
    else
      @file_upload = @partner.file_uploads.build(file_params)
      if @file_upload.save!
        redirect_to @partner, notice: "SUCCESSFULLY UPLOAD."
      end
    end
  end

  private
    def file_params
      params.require(:file_upload).permit(:file)
    end
end
