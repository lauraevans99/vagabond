class UsersController < ApplicationController

	def welcome
		 
	end

	def new
		@user = User.new

	end

	def create
		#user_params = params.require(:user).permit(:alias, :email_digest, :password)
		user = User.create(user_params)
		if user.save
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/users/new"
		end
	end

	def show
		id = params[:id]
		@user = User.find(id)
	end

	def user_params
		params.require(:user).permit(:alias, :email_digest, :password, :password_confirmation)
	end

end
