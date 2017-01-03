class Listing < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = "Property Type"
end
