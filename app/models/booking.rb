class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates :checkin, :checkout, :user_id, :listing_id, presence: true
	validates :checkin, :checkout, :overlap => {:exclude_edges => ["starts_at", "ends_at"], :scope => "listing_id"}
end

