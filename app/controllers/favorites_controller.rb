class FavoritesController < ApplicationController
  def create
    current_user.favorites.find_or_create_by(post_id: params[:post_id])

    respond_to do |format|
      format.html {redirect_to post_path(post_path(params[:id]))} 
      format.json 
    end
  end
  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:id])
    favorite.destroy if favorite
    respond_to do |format|
      format.html {redirect_to post_path(post_path(params[:id]))} 
      format.json 
    end
  end

end
