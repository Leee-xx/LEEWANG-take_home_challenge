class InventoryController < ApplicationController

  def index
    load_from_scan if params[:scan]
  end

  private

  def load_from_scan
    if params[:scan] =~ Location::REGEXP_MATCH
      @location = Location.find_by_name(params[:scan])
      @inventories = Inventory.at_location(@location)
    else
      @product = Product.find_by_code(params[:scan])
      @inventories = Inventory.of_product(@product)
    end
  end

end
