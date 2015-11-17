class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates :checkin, :checkout, :user_id, :listing_id, presence: true
	validates :checkin, :checkout, :overlap => {:scope => "listing_id"}
end

