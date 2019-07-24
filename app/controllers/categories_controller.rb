class CategoriesController < ApplicationController
  before_action :find_favorites, only:[:index],if: :user_signed_in?

  def index
    @posts = Post.all.order("created_at DESC").limit(20).includes(:user)
  end

end
