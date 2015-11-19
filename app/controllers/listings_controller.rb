class ListingsController < ApplicationController
	include ApplicationHelper
	before_action :authenticate_user!, except: [:index, :show, :new]
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)

		if current_user.nil?
			redirect_to new_login_path
		else
			@listing.user_id = current_user.id
			photos = params[:listing][:photo]
			if @listing.save
				photos.each do |p|
					listingphoto = ListingPhoto.new
					listingphoto.photo = p
					listingphoto.listing_id = @listing.id
					listingphoto.save
				end
	      flash[:notice] = "Your listing is successful"
	      redirect_to @listing
	    else
	    	flash[:notice] = "Bummer, there was a problem in creating your listing. Please try again"
	      render action: "new"
	    end
	  end

	end

	def index
		@listings = Listing.search(params[:location]

	end

	def show
		@user = @listing.user
		@listingphotos = @listing.listing_photos
		@booking = Booking.new
	end

	def edit

	end

	def update

			if @listing.update(listing_params)
	      redirect_to @listing
	    else
	    render :edit
	    end
	end

	def destroy

		@listing.destroy
		flash[:notice] = "Your listing #{@listing.listing_name} has been deleted."
		redirect_to listings_path
	end
	
	private 

  def listing_params
    params.require(:listing)
        .permit(:listing_name, :home_type, :accomodates, :no_of_rooms, :smoking, :price_per_night, :description, :street_address, :country, :city, :state, :photo)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end


