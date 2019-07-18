class PostsController < ApplicationController
  def index
    @posts = Category.find(params[:category_id]).posts.order("created_at DESC").includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to category_posts_path(post_params[:category_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:category_id).merge(user_id:current_user.id)
  end

end
