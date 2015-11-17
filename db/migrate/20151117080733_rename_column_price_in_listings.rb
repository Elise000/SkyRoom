class RenameColumnPriceInListings < ActiveRecord::Migration
  def change
  	rename_column :listings, :price, :price_per_night
  end
end
