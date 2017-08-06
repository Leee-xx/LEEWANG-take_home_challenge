class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :location

  scope :at_location, ->(location) {
    select("inventories.*, COUNT(inventories.id) AS total, fulfillment_centers.name as fulfillment_center").
      where(location: location).
      joins(:product, :location => :fulfillment_center).
      group(:product_id)
  }

  scope :of_product, ->(product) {
    select("inventories.*, COUNT(inventories.id) AS total, fulfillment_centers.name as fulfillment_center").
      where(product: product).
      joins(:location => :fulfillment_center).
      group(:location_id)
  }
end

