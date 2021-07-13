class CommentLikesController < ApplicationController

  def create
    @like = CommentLike.new(comment_likes_params)
    if @like.save
      redirect_back(fallback_location: root_path, notice: "You liked a comment!!")
    else
      redirect_back(fallback_location: root_path, notice: "Something went wrong!!")
    end
  end

  def destroy
    @like = CommentLike.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path, notice: "You unliked a comment!!")
  end

  private
  def comment_likes_params
    params.require(:comment_like).permit(:user_id, :comment_id)
  end

end
