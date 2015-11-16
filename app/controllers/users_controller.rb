class UsersController < ApplicationController

	def welcome
		id = session[:user_id]
		if id
			@user = User.find(id)
		end	
	end

	def new
		id = session[:user_id]
		if id
			@user = User.find(id)
			# redirect_to '/users/#{@user.id}'
			redirect_to '/users/#{@user.id}'
		else	
			@user = User.new
			render 'new'
			# redirect_to '/users/#{@user.id}'
		end

	end

	def create
		#user_params = params.require(:user).permit(:alias, :email_digest, :password)
		@user = User.create(user_params)
		
		if @user.save
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/sign_in"
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



	
			private
	

	def user_params
		params.require(:user).permit(:alias, :email_digest, :password, :password_confirmation, :avatar)
	end

end
