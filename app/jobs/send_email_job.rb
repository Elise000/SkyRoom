class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(booking)
  	BookingMailer.booking_email(booking).deliver_now
    # Do something later
  end
end
