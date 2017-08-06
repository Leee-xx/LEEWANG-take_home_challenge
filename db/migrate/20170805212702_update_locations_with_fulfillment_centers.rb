class UpdateLocationsWithFulfillmentCenters < ActiveRecord::Migration
  FC_NAME1 = "Defaultville"
  FC_NAME2 = "Acid Mothers Temple"

  def up
    FulfillmentCenter.transaction do
      Location.reset_column_information
      sf_fc = FulfillmentCenter.where(name: FC_NAME1).first_or_create!(
                    :city => "South San Francisco",
                    :country => "USA",
                    :rows => 10,
                    :racks => 10,
                    :shelves => 5
                    )

      # Update existing locations with new fulfillment center
      Location.update_all({ :fulfillment_center_id => sf_fc.id })


      jp_fc = FulfillmentCenter.where(name: FC_NAME2).first_or_create!(
                    :city => "Kyoto",
                    :country => "Japan",
                    :rows => 15,
                    :racks => 15,
                    :shelves => 6
                    )

      # Create locations for new FC
      if jp_fc.locations.size.zero?
        (1..jp_fc.rows).each do |row|
          (1..jp_fc.racks).each do |rack|
            (1..jp_fc.shelves).each do |shelf|
              Location.create!(:row => row, :rack => rack, :shelf => shelf, :fulfillment_center_id => jp_fc.id)
            end
          end
        end
      end

    end

  end

  def down
    FulfillmentCenter.transaction do
      sf_fc = FulfillmentCenter.where(name: @FC_NAME1).first
      jp_fc = FulfillmentCenter.where(name: @FC_NAME2).first

      if sf_fc.present?
        Location.where(:fulfillment_center_id => sf_fc.id).update_all({ :fulfillment_center_id => nil})
        sf_fc.try(:destroy)
      end

      if jp_fc.present?
        Location.delete_all(:fulfillment_center_id => jp_fc.id)
        jp_fc.try(:destroy)
      end
    end
  end

end
