class Listing < ActiveRecord::Base
	
	belongs_to :user
	has_many :bookings

	mount_uploaders :photos, PhotoUploader

	self.inheritance_column = "Property Type"

	# def self.search(search)
	#   if search
	#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	#   else
	#     find(:all)
	#   end
	# end
end
