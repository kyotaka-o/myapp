class TopController < ApplicationController
  before_action :find_favorites, only:[:index],if: :user_signed_in?

  def index
    @posts = Post.all.order("created_at DESC").limit(20).includes(:user,:category,:status)
    @infomations = Infomation.all.order("created_at DESC")
  end
end
