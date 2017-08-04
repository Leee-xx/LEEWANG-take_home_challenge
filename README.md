# Take-home challenge: Global FC

Tobi is an online fast fashion retailer. We design, produce, and sell our products globally and exclusively on tobi.com. We wrote our own warehouse management system in Ruby on Rails to power our single Fullfillment Center (FC) located in South San Francisco. Among other things, the system tracks where we store inventory on the warehouse floor.

This take home challenge is a simplified web-based inventory management system consisting of products, inventory, and locations backed by a SQLite database. We’ve built an inventory lookup tool that accepts either a ‘product code’ or ‘location’ and displays the results.

Searching for a product code will return all locations for inventory items of that product. Searching for a warehouse location (row-rack-shelf) will display all inventory items or products stored at that location. Try searching for location “1-1-1”, which corresponds to Row 1, Rack 1, Shelf 1. Note: In our current FC we have 10 rows, 10 racks, and 5 shelves.

## Vocabulary
<dl>
  <dt>FC</dt>
  <dd>Our fulfillment center, which includes the warehouse, receiving, shipping, and return handling functions.</dd>
  <dt>Inventory</dt>
  <dd>Represents a distinct item of inventory for a given product. If you are selling 10 Red Dresses in size Medium, you will have one product with 10 items of inventory.</dd>
  <dt>Location</dt>
  <dd>Our internal representation of a row, rack, and shelf located in our FC for storing inventory items. Location those 3 values dash-delimited.</dd>
  <dt>Product</dt>
  <dd>Description of the inventory items being sold.</dd>
</dl>

## Problem

People are placing orders for our products from all over the globe and we want to offer faster and better service to the folks on the other side of it as we continue to scale our business. 

## Solution

It's time to add support for more than one fulfillment center. The new FC will have different dimensions than our first, with more rows and shelves than our original FC. Additionally we want to augment the tool with some minor productivity enhancements.

You have free reign to modify the data-model, application code, front-end code, utilize gems, additional frameworks, etc if they add value.

## Project Requirements

Please complete the steps below. 
1. Support Global Fulfillment
    * Create a fulfullment-center model (minimally a name, city, and country).
    * Modify the locations model to support more than one FC.

2. Create a new FC
    * Pre-populate the locations (row, rack, and shelf) for the FC.  
_Note: There will be 15 rows, 15 racks and 6 shelves in the new FC (compared to the 10 rows, 10 racks, and 5 shelves in our first FC)._

3. Inventory Lookup Tool
    * We want to be able to move the location of an inventory item from one FC to another. Modify the 'Inventory Lookup' tool to allow this.
    * In the search results of the 'Inventory Lookup' tool, 'Product Code' and 'Location' should both be links that perform searches for their own values.


## Install

- Clone git repo: ```git clone gittobi:gittobi/take-home-challenge``` (obviously, how are you viewing this?)
- ```cd``` into project directory
- Create new git branch ```git checkout -b YOURNAME/take_home_challenge```
- run ```bundle install```
- migrate db ```RAILS_ENV=development ./bin/rake db:setup```
- start server ```RAILS_ENV=development ./bin/rails server```
- Only work on your new branch.
- Commit and push to remote when you feel you are complete.

## Stack
- Rails 4.2.1 & SQLite
- Ruby 2.2
- Bundler
