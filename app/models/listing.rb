class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_photos, dependent: :destroy
	has_many :bookings
	validates_presence_of :listing_name, :price, :street_address
end

