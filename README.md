# Take-home challenge: Global FC

Tobi is a vertically integrated Women's fashion company. We design, contract to manufacture, warehouse and ship clothing all around the globe. We wrote our own WMS (warehouse management system) in Ruby on Rails to power our single Fullfillment Center located in South San Francisco. Among other things, the WMS tracks where we store inventory on the warehouse floor.

So what you have here is a simplified web-based inventory management system consisting of products, inventory, and locations backed by a SQLite database. We've built an inventory lookup tool that accepts either a product code or location and displays the results.

Searching for a product code is synonymous with a SKU and is similar to a UPC code, will return all locations for inventory items of the given product.

Searching for a warehouse location (row-rack-shelf) will display all inventory items stored at that location. Try searching for location "1-1-1"  which corresponds to Row 1, Rack 1, Shelf 1. In our current FC we have 10 rows, 10 racks, and 5 shelves.

## Vocabulary
_FC_ : Our fulfillment center, which encompasses the warehouse, receiving, shipping, and return handling functions.

_Inventory_ : Represents a distinct item of inventory for a given product.

_Locations_: Our internal representation of a row, rack, and shelf located in our FC for storing inventory items. Location is a dash delimited concatenation of these 3 values.

_Products_: Description of the item being sold.

## Problem

People are placing orders for our products from all over the globe and we want to offer faster and better service to the folks on the other side of it as we continue to scale our business. It's time to add system support for multiple fulfillment centers.

The new FC will have different dimensions than our first, with more rows and shelves than our original FC.

We also want to augment the tool with some minor productivity enhancements.

You have free reign to modify the data-model, application code, front-end code, utilize gems, additional frameworks, etc if they add value.

## Requirements

1. Global Fulfillment

 Modify the database schema to support locations at more than one FC. Then pre-populate the new row, rack, and shelf locations for the new FC. There will be 15 rows, 15 racks and 6 shelves in the new FC as opposed to the 10 rows, 10 racks and 5 shelves in our first FC.

2. Inventory Lookup Tool

  * We want to be able to change the location of product inventory from one FC to another. Modify the 'Inventory Lookup' tool to allow this.
  * In the search results of the 'Inventory Lookup' tool, 'Product Code' and 'Location' should both be links that perform searches for their own values.


## Install

- Clone git repo (how are you viewing this?!)
- Do all work on a separate git branch and submit a pull request when you feel you are complete.
- ```cd``` into project directory
- run ```bundle install```
- migrate db ```RAILS_ENV=development ./bin/rake db:migrate```
- start server ```RAILS_ENV=development ./bin/rails server```

## Stack
- Rails 4.2.1 & SQLite
- Ruby 2.2
- Bundler
