class UsersController < ApplicationController
  def index
  end
  def show
    @posts = User.find(params[:id]).posts.order("created_at DESC").includes(:user)
  end
end
