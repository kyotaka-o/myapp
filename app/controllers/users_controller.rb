class UsersController < ApplicationController
  before_action :find_favorites, only:[:show],if: :user_signed_in?

  def index
    @users = User.all.includes(:posts)
    @users = @users.page(params[:page]).per(12)
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").includes(:user,:category).page(params[:page]).per(10)
    @favorite_posts = @user.fav_posts.order("created_at DESC").includes(:user).page(params[:page]).per(10)
  end

end
