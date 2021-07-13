class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    arr = current_user.friend_ids
    arr.push(current_user.id)
    @posts = Post.posts_for_home_page(arr)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.posts_for_current_user(@user.id)
  end

  def edit
    @post =  Post.find(params[:id])
  end

  def update
    @post =  Post.find(params[:id])
    @post.update(posts_params)
    redirect_to posts_path, notice: "Post updated successfully!!"
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "Post has been created successfully"
    else
      render :index
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post has been deleted successfully"
  end

  def delete_attachment
    @post = Post.find(params[:id])
    @post.post_images[params[:image_id].to_i].purge
    redirect_back(fallback_location: root_path)
  end

  private
  def posts_params
    params.require(:post).permit(:text, post_images:[] )
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "You are not authorized to perform this action!!" if @post.nil?
  end

end
