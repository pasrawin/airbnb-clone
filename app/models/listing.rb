class Listing < ActiveRecord::Base
	self.inheritance_column = "Property Type"
end
