class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
end


#https://github.com/zpaulovics/datetimepicker-rails