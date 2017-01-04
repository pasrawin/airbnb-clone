class BookingsController < ApplicationController

	def create
		@listing = Listing.find(params[:listing_id])
		@booking = current_user.bookings.new(booking_params)

		@booking.listing = @listing
		if @booking.save
			flash[:success] = "Successfully booked #{@listing.title} on #{@booking.start_date} to #{@booking.end_date}"
			redirect_to current_user
		else
			@errors = @booking.errors.full_messages
			render "listings/show"
		end
		
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to current_user
	end

	def booking_params
	params.require(:booking).permit(:start_date, :end_date)
	end
end
