class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  before_action :make_template, only:[:new]
  before_action :find_favorite, only:[:show],if: :user_signed_in?
  before_action :find_favorites, only:[:index,:search],if: :user_signed_in?
  impressionist :actions=> [:show] ,unique: [:session_hash]


  def index
    @current_category = Category.find(params[:category_id])
    if params[:search_status] == "open"
      @posts = Category.find(params[:category_id]).posts.where(status_id:1).order("created_at DESC").includes(:user,:status).page(params[:page]).per(10)
      @status = "open"
    elsif params[:search_status] == "closed"
      @posts = Category.find(params[:category_id]).posts.where(status_id:2).order("created_at DESC").includes(:user,:status).page(params[:page]).per(10)
      @status = "closed"
    else
      @posts = Category.find(params[:category_id]).posts.order("created_at DESC").includes(:user,:status).page(params[:page]).per(10)
      @status = ""
    end

  end

  def new
    if !user_signed_in?
      redirect_to categories_path
    end
    @post = Post.new 
  end

  def create
    if !user_signed_in?
      redirect_to categories_path
    end
    @post = Post.new(post_params)
    if params[:image] != nil
      add_more_images(image_params[:images])
    end
    if @post.save
      respond_to do |format|
        format.html {redirect_to post_path(post_path(params[:id]))} 
        format.json 
      end
    else
      render :new
    end
  end

  def show
    impressionist(@post, nil, unique: [:session_hash])
    @comments = Post.find(params[:id]).comments.order("created_at ASC").includes(:user,:post)
    @comment = Comment.new
  end

  def edit
    if user_signed_in?
      if @post.user_id == current_user.id 
        @new_post = Post.new
      else
        redirect_to categories_path
      end
    else
      redirect_to categories_path
    end
  end

  def update
    if @post.user_id == current_user.id 
      if @post.images != nil
        remove_image_at_index
      end

      if @post.video != nil
        if params[:current_video] == nil
          remove_video
        end
      end   

      update_params = post_params

      if params[:image] != nil
        add_more_images(image_params[:images])
        update_params[:images] = @post.images
      end

      if @post.update(update_params)
        respond_to do |format|
          format.html {redirect_to post_path(params[:id])} 
          format.json 
        end
      else
        render :edit
      end
    end
  end

  def destroy
    if @post.user_id == current_user.id 
      @post.destroy
    end
    redirect_to category_posts_path(@post.category_id)
  end


  def search 
    if params[:q] == nil
      @q = Post.ransack(params[:q])
    else
      params[:q]['title_or_body_cont_any'] = params[:q]['title_or_body_cont_any'].split(/[\p{blank}\s]+/)
      @q = Post.ransack(search_params)
    end
    @posts = @q.result.includes(:user,:category,:status).order("created_at DESC").page(params[:page]).per(10)

  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:category_id,:status_id,:video).merge(user_id:current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def find_favorite
    @favorite = Favorite.find_by_sql(['select * from favorites where (post_id = ?) and (user_id = ?)', params[:id],current_user.id])
    @favorite_all = Favorite.find_by_sql(['select * from favorites where (post_id = ?)', params[:id]]).count
  end

  def add_more_images(new_images)
    images = @post.images 
    images += new_images
    @post.images = images
  end

  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:image).permit({:images => []})
  end

  def remove_image_at_index
    remain_images = @post.images.dup
    indexes = params[:box]
    if indexes == nil
      @post.remove_images!
    else
      index = 0
      remain_index = 0
      delete_count = 0
      @post.images.each do |image|
        if index != indexes[remain_index].to_i
          remain_images.delete_at(index - delete_count) 
          delete_count += 1
        else
          remain_index += 1
        end
        index += 1
      end
      @post.images = remain_images
    end
  end

  def remove_video
    @post.remove_video!
  end

  def make_template
    @template = "#### どんなエラー？\r"+"***\r\r"+"#### どんな環境？\r"+"***\r\r"+"#### どうやって解決した？\r"+"***\r\r"
  end

  def search_params
    params.require(:q).permit!
  end

end
