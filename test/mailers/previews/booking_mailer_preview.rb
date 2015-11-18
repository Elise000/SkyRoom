# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
	 def booking_mail_preview
    BookingMailer.booking_email(User.first)
  end

end
