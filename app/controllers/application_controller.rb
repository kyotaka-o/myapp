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

    ids= Post.group(:user_id).order('count_user_id DESC').limit(5).count(:user_id).keys
    @ranking = ids.map{|user_id| User.find(user_id)}
    @counts = ids.map{|id| Post.where(user_id:id).count}
  end
end
