class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(booking_id)
  	BookingMailer.booking_email(booking_id).deliver_now
    # Do something later
  end
end


