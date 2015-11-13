class PostsController < ApplicationController

	def index
		id = session[:user_id]
		if id
			@user = User.find(id)
			@post = Post.where(user_id: @user.id)
		else
			redirect_to "/"
		end
	end

	def new
		@post = Post.new
		@user = User.find(session[:user_id])
	end

	def create
		post_params = params.require(:post).permit(:title, :body, :user_id, :city_id)
		@post = Post.create(post_params)
		@user = User.find(session[:user_id])
		if @post.save
			redirect_to "/users/#{@user.id}/posts"
		else
			redirect_to "/"
		end
	end
>>>>>>> 89113d20ff521f3f3517292ee2b9493176c0aa83
	
end
