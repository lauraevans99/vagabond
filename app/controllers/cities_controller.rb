class CitiesController < ApplicationController

	def index
		@cities = City.all
		gon.cities = @cities
		render :index

	end
	
	def show
		@city = City.find(params[:id])
		# id = cities[:city_id]
		if @city
			
			render :show
			# redirect_to "/cities/#{@city.id}/posts"
		else 
			redirect_to "/cities"
		end
	end
end
