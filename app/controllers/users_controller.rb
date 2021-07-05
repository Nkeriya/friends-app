class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id, only: [:show, :friendlist]

  def index
    @users = User.registered_users(current_user.id)
    arr1 = Friendship.friend_ids(current_user.id)
    arr2 = Friendship.inv_friend_ids(current_user.id)
    @friend_ids = arr1.concat(arr2).uniq
  end

  def show
  end

  def search
    @search =  params[:search]
    if @search.blank?   
      redirect_back(fallback_location: search_page_path, notice: "Search field is empty!!")
    else
      @results = User.search_user(@search)
    end
  end
  
  def friendrequest
  end

  private
  def set_id
    @user = User.find(params[:id])
  end
end
