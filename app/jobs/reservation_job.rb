class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, reservation_id)
    # Do something later
    ReservationMailer.booking_email(customer, host, reservation_id).deliver_now
			# flash[:success] = "Successfully booked #{@listing.title} on #{@booking.start_date} to #{@booking.end_date}"
  end
end
