class CategoriesController < ApplicationController
  before_action :find_favorites, only:[:index],if: :user_signed_in?

  def index
    @posts = Post.all.order("created_at DESC").limit(20).includes(:user)
    @infomations = Infomation.all.order("created_at DESC")
    
    categories = Category.all
    @category_names = []
    @category_names[0] = "all"
    categories.each do |category|
      @category_names.push(category.name)
    end
  end

end
