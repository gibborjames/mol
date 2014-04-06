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
      params.require(:item).permit(:chassis_no, :size, :container_no, :customer)
    end
end
