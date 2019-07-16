class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @random_categories = Category.order("random()").limit(6)
  end
end
