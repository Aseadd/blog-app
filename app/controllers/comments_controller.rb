class CommentsController < ApplicationController
  def new
    Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: :comment } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.new(text: params[:comment][:text], post: post, author: current_user)
    if comment.save
      redirect_to user_post_path(user, post)
    else
      flash.now[:error] = 'Error: comment could not be saved'
      render :new, locals: { comment: :comment }
    end
  end
end
