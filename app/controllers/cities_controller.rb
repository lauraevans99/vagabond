class CitiesController < ApplicationController

	def index

		id = session[:user_id]
		if id
			@user = User.find(id)
			@cities = City.all
			gon.cities = @cities
			render :index
		else
			@user = User.new
		end
		# redirect_to '/cities'
	end
	
	def show
		id = session[:user_id]
		@city = City.find(params[:id])
		@user = User.find(id)
		# id = cities[:city_id]
		if @city
			
			render :show
			# redirect_to "/cities/#{@city.id}/posts"
		else 
			redirect_to "/cities"
		end
	end
end
