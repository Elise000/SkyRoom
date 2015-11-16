class BookingsController < ApplicationController
	include ApplicationHelper

	def new
		@booking = Booking.new
		@listing = Listing.find(params[:listing_id])

	end

	def create

		@booking = Booking.new(booking_params)
		byebug
		if @booking.save
			flash[:success] = "Booking Done"
			redirect_to root_path
		else
			render:'new'
		end

	end

	private 

  def booking_params
    params.require(:booking)
        .permit(:checkin, :checkout, :user_id, :listing_id)

  end
end
