class BookingsController < ApplicationController
	include ApplicationHelper

	def new
		@booking = Booking.new
		@listing = Listing.find(params[:listing_id])

	end

	def create
		@listing = Listing.find(params[:listing_id])
	end

end
