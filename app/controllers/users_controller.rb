class UsersController < ApplicationController

	def welcome
		 
	end

	def new
		@user = User.new

	end

	def create
		user_params = params.require(:user).permit(:alias, :email_digest, :password, :password_confirmation)
		@user = User.create(user_params)
		if @user.save
			redirect_to user_path(@user)
		else
			redirect_to "/users/new"
		end
	end

	def show
		id = params[:id]
		@user = User.find(id)
	end

end
