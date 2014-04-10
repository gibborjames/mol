class ItemsController < ApplicationController

  def show
    @partners = Partner.all
    @partner = Partner.find(params[:partner_id])
    @item = Item.find(params[:id])
  end

  def update
    @partner = Partner.find(params[:partner_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to [@partner], notice: "SUCCESSFULLY UPDATE."
    else
      redirect_to [@partner, @item], notice: "ERROR."
    end
  end

  def edit
    @partners = Partner.all
    @partner = Partner.find(params[:partner_id])
    @item = Item.find(params[:id])
  end

  private
    def item_params
      params.require(:item).permit(:leasing_company, :chassis_no, :size, :container_no, :booking_no, :customer, :pull_out_date, :pull_out_time_out, :pull_out_tracker, :pull_out_plate_no, :return_eir_no, :return_date, :return_time_in, :return_tracker, :return_plate_no)
    end
end
