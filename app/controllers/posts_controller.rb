class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  def index
    @posts = Category.find(params[:category_id]).posts.order("created_at DESC").includes(:user)
    @current_category = Category.find(params[:category_id]).name
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
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @post.user_id == current_user.id 
      @post.destroy
    end
    redirect_to category_posts_path(@post.category_id)
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:category_id,:status).merge(user_id:current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
