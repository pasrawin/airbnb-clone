class ListingsController < ApplicationController

	before_action :find_listing, only: [:show, :edit, :update]

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		#listings<<many listings belong to that user
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		end
	end

	def show
		#rake routes tells the route
		@listing = Listing.find_by_id(params[:id])
		@booking = @listing.bookings.new
		# @total_price = @booking.end_date - @booking.start_date
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			flash[:success] = "Successfully updated the list"
			redirect_to @listing
		else
			flash[:danger] = "Error updated the list"
			render :edit
		end
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title, :city, :country, :address, :status, :price, :type)
	end

	def search
  	@listings = Listing.search(params[:search])
  end

end
