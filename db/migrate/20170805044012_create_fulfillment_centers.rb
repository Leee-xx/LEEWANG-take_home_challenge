class CreateFulfillmentCenters < ActiveRecord::Migration
  def up
    create_table :fulfillment_centers do |t|
      t.string :name, unique: true
      t.string :city
      t.string :country
      t.integer :rows
      t.integer :racks
      t.integer :shelves

      t.timestamps null: false
    end

    add_column :locations, :fulfillment_center_id, :integer
  end

  def down
    remove_column :locations, :fulfillment_center_id
    drop_table :fulfillment_centers
  end
end
