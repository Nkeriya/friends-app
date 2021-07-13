class PostLikesController < ApplicationController

  def create
    @like = PostLike.new(post_likes_params)
    if @like.save
      redirect_back(fallback_location: root_path, notice: "You liked a post!!")
    else
      redirect_back(fallback_location: root_path, notice: "Something went wrong!!")
    end
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path, notice: "You unliked a post!!")
  end

  private
  def post_likes_params
    params.require(:post_like).permit(:user_id, :post_id)
  end
end
