class CitiesController < ApplicationController

	def index
		id = session[:user_id]
		if id
			@user = User.find(id)
		else
			@user = User.new
		end
		# redirect_to '/cities'
	end
	
end
