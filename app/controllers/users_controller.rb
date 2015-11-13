class UsersController < ApplicationController

	def welcome
		 
	end

	def new
		@user = User.new

	end

	def create
		#user_params = params.require(:user).permit(:alias, :email_digest, :password)
		@user = User.create(user_params)
		if @user.save
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/users/new"
		end
	end

	def show
		id = session[:user_id]
		if id
			@user = User.find(id)
		else 
			redirect_to "/"
		end
	end

	def edit
		id = params[:id]
		@user = User.find(id)
	end

	def update
		id = params[:id]
		@user = User.find(id)
		if @user.update_attributes(user_params)
			#handles a successful update
			redirect_to "/users/#{@user.id}"
		else 
			render 'edit'
		end
	end

	def user_params
		params.require(:user).permit(:alias, :email_digest, :password, :password_confirmation)
	end

end
