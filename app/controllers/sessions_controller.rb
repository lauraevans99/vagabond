class SessionsController < ApplicationController
	
	def new
		id = session[:user_id]
		if id
			@user = User.find(id)
		    redirect_to '/users/#{@user.id}'
			# redirect_to '/'
		else	
			@user = User.new
			render 'new'
			# redirect_to '/users/#{@user.id}'
		end
	end

	def create
		user_params = params.require(:user).permit(:email_digest, :password, :password_confirmation)
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			# flash[:error] = @user.errors.full_messages.to_sentence
			# flash.now[:danger] = 'Invalid email/password combination'
			# render 'new'
			redirect_to "/sign_in"
		end
	end

	def destroy
		logout
		redirect_to "/"
	end
end
