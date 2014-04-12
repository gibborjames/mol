class ChassisesController < ApplicationController

  def index
    @partners = Partner.all
    @items = Item.all
  end
end
