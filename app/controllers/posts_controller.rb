class PostsController < ApplicationController
  def index
    @posts = Category.find(params[:category_id]).posts.includes(:user)
    
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:category_id).merge(user_id:current_user.id)
  
  end

end
