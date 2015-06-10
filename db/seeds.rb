# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RANDOM_CLOTHINGS = [ 'Pants', 'Dress', 'Skorts', 'Lederhosen', 'Tights', 'Romper', 'Jeggings', 'Pajeans' ]
RANDOM_COLORS = [ 'Blue', 'Black', 'Red', 'Mauve', 'Yellow', 'Chartruese', 'Ox Blood', 'Sriracha' ]

# create locations
(1..10).each do |row|
  (1..10).each do |rack|
    (1..5).each do |shelf|
      Location.create!(:row => row, :rack => rack, :shelf => shelf)
    end
  end
end

# create products
RANDOM_CLOTHINGS.each_with_index do |clothing, clothing_i|
  RANDOM_COLORS.sample(RANDOM_COLORS.size).each_with_index do |color, color_i|
    # code = clothing first letter, clothing index padded 3 wide, color index padded 3 wide, color first letter
    product_code = "#{clothing[0]}#{clothing_i.to_s.ljust(3,'0')}#{color_i.to_s.ljust(3,'0')}#{color[0]}"
    product_name = "#{color} #{clothing}"
    Product.create!(:code => product_code, :name => product_name)
  end
end

# create inventories
all_locations = Location.all

Product.all.each do |product|
  all_locations.sample(4).each do |location|
    # create 1-5 inventory rows in each location
    (rand(5)+1).times do
      Inventory.create!(:product => product, :location => location)
    end
  end
end
