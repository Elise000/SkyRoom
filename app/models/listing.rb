class Listing < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :listing_name, :price, :street_address
end

