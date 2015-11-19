class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_photos, dependent: :destroy
	has_many :bookings
	validates_presence_of :listing_name, :price_per_night, :street_address
	
	searchkick

	def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

end
