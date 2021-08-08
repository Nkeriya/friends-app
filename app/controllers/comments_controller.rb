class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_post
  before_action :set_comment_id, only: [:edit, :update, :destroy]

  def create
    byebug
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_back(fallback_location: root_path, notice: "Comment added successfully!!")
    else
      redirect_back(fallback_location: root_path, notice: @comment.errors.full_messages)
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to posts_path, notice: "Comment updated succesfully!!"
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: "Comment deleted succesfully!!")
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_path, notice: "You are not authorized to perform this action!!" if @comment.nil?
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment_id
    @comment = @post.comments.find(params[:id])
  end
end