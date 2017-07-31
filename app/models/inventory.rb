class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :location

  scope :at_location, ->(location) {
    select("inventories.*, COUNT(inventories.id) AS total").where(location: location).joins(:product).group(:product_id)
  }

  scope :of_product, ->(product) {
    select("inventories.*, COUNT(inventories.id) AS total").where(product: product).joins(:location).group(:location_id)
  }
end
