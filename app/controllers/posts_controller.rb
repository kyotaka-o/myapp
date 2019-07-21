class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  before_action :make_template, only:[:new]

  def index
    @posts = Category.find(params[:category_id]).posts.order("created_at DESC").includes(:user)
    @current_category = Category.find(params[:category_id]).name
  end

  def new
    @post = Post.new
  end

  def create
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
  end

  def edit
    @new_post = Post.new
  end

  def update
    if @post.images != nil
      remove_image_at_index
    end

    update_params = post_params

    if params[:image] != nil
      add_more_images(image_params[:images])
      update_params[:images] = @post.images
    end

    if @post.update(update_params)
      respond_to do |format|
        format.html {redirect_to post_path(post_path(params[:id]))} 
        format.json 
      end
    else
      render :edit
    end
  end

  def destroy
    if @post.user_id == current_user.id 
      @post.destroy
    end
    redirect_to category_posts_path(@post.category_id)
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:category_id,:status,:video).merge(user_id:current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def add_more_images(new_images)
    # binding.pry
    images = @post.images 
    images += new_images
    @post.images = images
  end

  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:image).permit({:images => []})
  end

  def remove_image_at_index
    # binding.pry
    remain_images = @post.images.dup
    indexes = params[:box]
    if indexes == nil
      @post.remove_images!
    else
      index = 0
      remain_index = 0
      delete_count = 0
      @post.images.each do |image|
        # binding.pry
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
  def make_template
    @template = "#### どんなエラー？\r"+"***\r\r"+"#### どんな環境？\r"+"***\r\r"+"#### どうやって解決した？\r"+"***\r\r"
  end

end
