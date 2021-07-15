class CommentLikesController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @count = @comment.like_count[0]
    @comment_likes = @comment.like_count[1]
  end

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
