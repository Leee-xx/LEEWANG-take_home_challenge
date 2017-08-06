class PopulateJapanFulfillmentCenterInventory < ActiveRecord::Migration
  def change
    jp = FulfillmentCenter.where(country: "Japan").first

    ActiveRecord::Base.transaction do
      # create inventories
      all_locations = Location.where(:fulfillment_center_id => jp.id)

      Product.all.each do |product|
        all_locations.sample(4).each do |location|
          # create 1-5 inventory rows in each location
          (rand(5)+1).times do
            Inventory.create!(:product => product, :location => location)
          end
        end
      end
    end

  end
end
