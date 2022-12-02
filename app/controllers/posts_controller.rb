class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
   end  
    
    def show
     @post = Post.find(params[:id])
    end

      def create
     @post = current_user.posts.new(post_params)
    
     if @post.save
        flash[:notice] = "Post is saved successfully."
        redirect_to users_path(current_user, @post)
     else
        render :new
        flash[:alert] = "Post is not saved."
     end
      end
    
      private

      def post_params
        params.require(:post).permit(:title, :text)
     end

end
