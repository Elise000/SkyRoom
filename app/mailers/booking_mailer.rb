class BookingMailer < ApplicationMailer
	default from: "elise.supercostume@gmail.com"

  def booking_email(booking_id)
  	@booking = Booking.find(booking_id)
  	byebug
    @customer = @booking.user
    @listing = @booking.listing
    # @host = @booking.listing.user
    mail(to: @customer.email, subject: 'Customer Test Booking Email')
  end

end