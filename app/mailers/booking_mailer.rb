class BookingMailer < ApplicationMailer
	default from: "elise.supercotsume@gmail.com"

#   def booking_email()
#     @user = user
#     mail(to: "elise82@gmail.com", subject: 'Test Booking Email')
#   end
# end

  def booking_email(booking)

  	@booking = booking
    @customer = @booking.user
    # @host = @booking.listing.user
    mail(to: @customer.email, subject: 'Customer Test Booking Email')
  end

end