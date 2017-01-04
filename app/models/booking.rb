class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates

  def check_overlapping_dates
  	listing.bookings.each do |old_booking|
  		if overlap?(self, old_booking)
  			return errors.add(:overlapping_dates, "This booking is not valid")
  		end
  	end
  end

  def overlap?(x,y)
  	(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

  def total_price
  	price = listing.price
  	num_dates = (start_date..end_date).to_a.length - 1
  	return price * num_dates
  end
end
