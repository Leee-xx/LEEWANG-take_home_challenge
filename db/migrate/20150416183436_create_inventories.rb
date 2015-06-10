class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :location_id

      t.timestamps null: false
    end

    add_foreign_key :inventories, :products
    add_foreign_key :inventories, :locations
  end
end
