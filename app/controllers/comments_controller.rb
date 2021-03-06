class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Comment added"
		else
			flash[:error] = "Something happened."
		end
		redirect_to :back
	end

	def destroy
		Comment.find(params[:id]).destroy
		flash[:success] = "Comment deleted"
		redirect_to :back
	end

private

	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
