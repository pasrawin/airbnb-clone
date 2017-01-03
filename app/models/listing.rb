class Listing < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = "Property Type"

	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
