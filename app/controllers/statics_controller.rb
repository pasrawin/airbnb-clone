class StaticsController < ApplicationController
	def home
			@users = User.find_by id: current_user.id if signed_in?
	end
end
