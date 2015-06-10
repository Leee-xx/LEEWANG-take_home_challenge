# Take-home challenge: Global FC

What you have here is a simplified web-based inventory management system consisting of products, inventory, and locations backed by SQLite. We've built an inventory lookup tool that accepts either a product code or location and displays the results.

Searching for a product code will return all locations for inventory items of that product.

Searching for a location will display all inventory items stored at that location.

Try searching for location "1-1-1" (Row 1, Rack 1, Shelf 1). In our current FC we have 10 rows, 10 racks and 5 shelves.

## Vocabulary
_FC_ : Our fulfillment center.

_Inventory_ : Represents a distinct item of inventory for a given product.

_Locations_: A representation of a row, rack, and shelf located in our FC for storing inventory items. Location is a dash delimited concatenation of these 3 values.

_Products_: Description of the item being sold.

## Problem

People are placing orders for our products from all over the globe and we want to offer better service to the folks on the other side of it as we continue to scale. It's time to add system support for multiple fulfillment centers.

The new FC will have different dimensions than our first, with more rows and shelves than our original FC.

We also want to augment the tool with some minor productivity enhancements.

You have free reign to modify the data-model, application code, front-end code, utilize gems, additional frameworks, etc if they add value.

## Requirements

1. Global Fulfillment

 Modify the database schema to support locations at more than one FC. Then pre-populate the new row, rack, and shelf locations for the new FC. There will be 15 rows, 15 racks and 6 shelves in the new FC as opposed to the 10 rows, 10 racks and 5 shelves in our first FC.

2. Inventory Lookup Tool

  * We need to be able to move all inventory for a given product in one FC to another location in the new FC. Modify the 'Inventory Lookup' tool to allow split all inventory for a product between two locations.
  * In the search results of the 'Inventory Lookup' tool:
    * 'Product Code' should link to a search for itself.
    * 'Location' should link to a search for itself.


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
