class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to posts_path, notice: "Comment added successfully!!"
    else
      redirect_back(posts_path, notice: "Something goes worng!!")
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_path, notice: "Comment updated succesfully!!"
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path, notice: "Comment deleted succesfully!!"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
