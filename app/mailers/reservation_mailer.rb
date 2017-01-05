class ReservationMailer < ApplicationMailer
	default from: 'khota1177@gmail.com' 
	
	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@booking = Booking.find_by_id(reservation_id)
		@url = "http://www.google.com" ### chk for route first
		mail(to: @host.email, subject: 'You got a new booking!')
	end

	def canceling_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@url = "http://www.google.com" 
		mail(to: @host.email, subject: 'Your booking is just canceled')
	end

end
