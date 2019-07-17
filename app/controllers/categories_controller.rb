class CategoriesController < ApplicationController
  def index
    @cube_elements = ["front","back","left","right","top","bottom"]
    @categories = Category.all
    @random_categories = Category.order("random()").limit(6)
  end
end
