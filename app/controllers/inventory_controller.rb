class InventoryController < ApplicationController
  def index
    load_from_scan if params[:scan]
  end

  def move
    params.permit(:location_id, :scan, {:location => [:fulfillment_center_id]})
    fcenter_id = params[:location][:fulfillment_center_id]
    location = Location.find(params[:location_id])
    location.fulfillment_center_id = fcenter_id
    location.save
    redirect_to inventory_url(scan: params[:scan])
  end

  private

  def load_from_scan
    @fcenters = FulfillmentCenter.all
    if params[:scan] =~ Location::REGEXP_MATCH
      @location = Location.find_all_by_name(params[:scan])
      @inventories = Inventory.at_location(@location)
    else
      @product = Product.find_by_code(params[:scan])
      @inventories = Inventory.of_product(@product)
    end
  end
end
