class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts)
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").includes(:user)
  end
end
