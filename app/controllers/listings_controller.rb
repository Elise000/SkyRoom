class ListingsController < ApplicationController
	include ApplicationHelper

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if current_user.nil?
			redirect_to new_login_path
		else
			@listing.user_id = current_user.id
			if @listing.save
	      flash[:notice] = "Thank you for your submission. Your listing is successful"
	      redirect_to @listing
	    else
	      render action: "new"
	    end
	  end
	end

	def index
		@listings = current_user.listings

	end

	def show
		@listing = Listing.find(params[:id])
		@user = @listing.user
	end

	def edit
		@listing = Listing.find(params[:id])
	end
	
	private 

  def listing_params
    params.require(:listing)
        .permit(:listing_name, :home_type, :accomodates, :no_of_rooms, :smoking, :price, :description, :street_address, :country, :city, :state)
  end

end


