class CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@user = User.find(session[:user_id])
		@post = Post.find(params[:post_id])
		@city = City.find(@post.city_id)
	end 

	def index
		@user = User.find(session[:user_id])
		@post = Post.find(params[:post_id])
	end

	def create
		comment_params = params.require(:comment).permit(:body, :user_id, :post_id)
		@comment = Comment.create(comment_params)
		if @comment.save
			redirect_to "/cities"
		else
			redirect_to "/"
		end
	end
end
