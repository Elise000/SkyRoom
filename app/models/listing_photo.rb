class ListingPhoto < ActiveRecord::Base
	belongs_to :listing
	validates :photo, :listing_id, presence: true

	mount_uploader :photo, ListingPhotosUploader

end
