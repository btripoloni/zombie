class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.save
		redirect_to @post
	end

	def delete
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

	private
		def comment_params
	    params.require(:comment).permit(:name, :email, :comment, :show_email)
	  end
end