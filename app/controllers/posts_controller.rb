class PostsController < ApplicationController
	def index
	end

	def create
		begin
			@post = Post.create!(post_params)
			redirect_to action: 'index'
		rescue ActiveRecord::RecordInvalid => error
			render action: 'new'
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
