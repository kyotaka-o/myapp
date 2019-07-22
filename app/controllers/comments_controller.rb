class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])

    else
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id 
    redirect_to post_path(params[:post_id])
  end
  private
  def comment_params
    params.require(:comment).permit(:body,:image).merge(user_id:current_user.id,post_id:params[:post_id])
  end
end
