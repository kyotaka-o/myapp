class UsersController < ApplicationController
  before_action :find_favorites, only:[:show],if: :user_signed_in?

  def index
    if params[:q] == nil
      @q = User.ransack(params[:q])
    else
      @q = User.ransack(search_params)
    end
    @users = @q.result.page(params[:page]).per(12)

  end

  def show
    categories = Category.all
    @category_names = []
    @category_names[0] = "all"
    categories.each do |category|
      @category_names.push(category.name)
    end
    if params[:search_status] == "open"
      status = 1
    elsif params[:search_status] == "closed"
      status = 2
    end
    @user = User.find(params[:id])
    cate = Category.where("name =?",params[:category_name])
    @posts = @user.posts.order("created_at DESC").includes(:category,:status).page(params[:show_user]).per(10)

    if ((params[:search_status] != nil) && (params[:search_status] != "all")) || ((params[:category_name] != nil) && (params[:category_name] != "all"))
      if ((params[:search_status] == nil) || (params[:search_status] == "all"))
        @posts = @user.posts.where("category_id =?",cate.ids).order("created_at DESC").includes(:category,:status).page(params[:show_user]).per(10)   
      elsif (params[:category_name] == nil) || (params[:category_name] == "all")
        @posts = @user.posts.where("status_id=?",status).order("created_at DESC").includes(:category,:status).page(params[:show_user]).per(10)
      else
        @posts = @user.posts.where("category_id =? and status_id =?",cate.ids,status).order("created_at DESC").includes(:category,:status).page(params[:show_user]).per(10)
      end
    end

    if params[:favo_search_status] == "open"
      favo_status = 1
    elsif params[:favo_search_status] == "closed"
      favo_status = 2
    end
    cate = Category.where("name =?",params[:favo_category_name])
    @favorite_posts = @user.fav_posts.order("created_at DESC").includes(:user,:category,:status).page(params[:show_favo]).per(10)
    if ((params[:favo_search_status] != nil) && (params[:favo_search_status] != "all")) || ((params[:favo_category_name] != nil) && (params[:favo_category_name] != "all"))
      if ((params[:favo_search_status] == nil) || (params[:favo_search_status] == "all"))
        @favorite_posts = @user.fav_posts.where("category_id =?",cate.ids).order("created_at DESC").includes(:user,:category,:status).page(params[:show_favo]).per(10)  
      elsif (params[:favo_category_name] == nil) || (params[:favo_category_name] == "all")
        @favorite_posts = @user.fav_posts.where("status_id =?",favo_status).order("created_at DESC").includes(:user,:category,:status).page(params[:show_favo]).per(10)
      else
        @favorite_posts = @user.fav_posts.where("category_id =? and status_id=?",cate.ids,favo_status).order("created_at DESC").includes(:user,:category,:status).page(params[:show_favo]).per(10)
      end
    end
    @status = params[:search_status]
    @category = params[:category_name]
    @favo_status = params[:favo_search_status]
    @favo_category = params[:favo_category_name]
  end
  
  private
  def search_params
    params.require(:q).permit!
  end
end
