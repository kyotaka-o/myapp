class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_theme
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image])
  end

  def create_theme
    @cube_elements = ["front","back","left","right","top","bottom"]
    @random_categories = Category.order("random()").limit(6)
    @categories = Category.all.order('id ASC')
    @statuses = Status.all.order('id ASC')
    #ユーザーランキング
    ids= Post.group(:user_id).order('count_user_id DESC').limit(5).count(:user_id).keys
    @ranking = ids.map{|user_id| User.find(user_id)}
    @counts = ids.map{|id| Post.where(user_id:id).count}
    #お気に入りランキング
    favo_ids= Favorite.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys
    @favo_ranking = favo_ids.map{|post_id| Post.find(post_id)}
    @favo_counts = favo_ids.map{|id| Favorite.where(post_id:id).count}
    #カテゴリ別投稿数ランキング
    cate_ids= Post.group(:category_id).order('count_category_id DESC').limit(5).count(:category_id).keys
    @cate_ranking = cate_ids.map{|category_id| Category.find(category_id)}
    @cate_counts = cate_ids.map{|id| Post.where(category_id:id).count}
    #閲覧数ランキング
    eye_ids= Impression.group(:impressionable_id).order('count_impressionable_id DESC').limit(5).count(:impressionable_id).keys
    @eye_ranking = eye_ids.map{|post_id| Post.find(post_id)}
    @eye_counts = eye_ids.map{|id| Post.find(id).impressionist_count}
  end

  def find_favorites
    @favorites = current_user.favorites
    @all_favorites = Favorite.all
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
      categories_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
      categories_path
  end
end
