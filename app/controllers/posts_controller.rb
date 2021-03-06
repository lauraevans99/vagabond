class PostsController < ApplicationController

	def index
		id = session[:user_id]
		if id
			@user = User.find(id)
			@post = Post.where(user_id: @user.id)
			@comments = Comment.where(user_id: @user.id)
		else
			redirect_to "/"
		end
	end

	def show
		id = session[:user_id]
		if id
			@user = User.find(id)
			@post = Post.where(user_id: @user.id, id: params[:id])
		else
			redirect_to "/"
		end
	end

	def new
		@post = Post.new
		@user = User.find(session[:user_id])
		@cities = City.all
	end

	def create
		post_params = params.require(:post).permit(:title, :body, :user_id, :city_id)
		@post = Post.create(post_params)
		@user = User.find(session[:user_id])
		if @post.save
			redirect_to "/users/#{@user.id}/posts"
		else
			# redirect_to "/users/#{@user.id}/posts"
			redirect_to "/users/#{@user.id}/posts/new", alert: @post.errors.full_messages 
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@comments = Comment.where({post_id: @post.id})

		@comments.each do |c|
			c.destroy
		end

		@post.destroy
		@user = User.find(session[:user_id])
		redirect_to "/users/#{@user.id}/posts"
	end

	def edit
		@post = Post.find(params[:id])
		@user = User.find(session[:user_id])
		# redirect_to "/users/#{@user.id}/posts/#{@post.id}/edit"
		# @post.update(title: , body: )
	end

	def update
		@post = Post.find(params[:id])
		post_params = params.require(:post).permit(:title, :body, :user_id, :city_id)
		@post.update_attributes(post_params)
		@user = User.find(session[:user_id])
		if @post.save
			redirect_to "/users/#{@user.id}/posts"
		else
			render 'edit'
		end
	end
	
end
