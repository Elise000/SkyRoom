class ListingPhoto < ActiveRecord::Base
	belongs_to :listing

	mount_uploader :photo, ListingPhotosUploader

end
