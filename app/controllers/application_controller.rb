class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_theme
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
  end

  def create_theme
    @cube_elements = ["front","back","left","right","top","bottom"]
    @random_categories = Category.order("random()").limit(6)
    @categories = Category.all
  end
end
