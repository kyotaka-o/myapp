class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts)
    @users = @users.page(params[:page]).per(12)
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").includes(:user)
    @posts = @posts.page(params[:page]).per(10)
  end
end
