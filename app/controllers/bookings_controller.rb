class BookingsController < ApplicationController
	include ApplicationHelper
	# require BookingMailer
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@booking = Booking.new
		@listing = Listing.find(params[:listing_id])

	end

	def create
		@booking = Booking.new(booking_params)
		@booking.user_id = current_user.id
		if @booking.save
			SendEmailJob.set(wait: 10.seconds).perform_later(@booking.id)
			flash[:success] = "Booking Done"
			redirect_to current_user
		else
			flash[:fail] = "We are sorry, dates not available. Please choose other dates"
			redirect_to listing_path(@booking.listing_id)
		end

	end

	def index
	end

	private 

  def booking_params
    params.require(:booking)
        .permit(:checkin, :checkout, :user_id, :listing_id)

  end
end
