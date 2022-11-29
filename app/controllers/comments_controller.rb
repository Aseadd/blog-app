class CommentController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end
end
