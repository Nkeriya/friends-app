class UsersController < ApplicationController
  def index
    @users = User.registered_users(current_user.id)
    @friend_ids = (current_user.friends + current_user.inverse_friends).pluck(:id)
    @requests = FriendRequest.where(req_received_id: current_user.id).pluck(:user_id)
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @search =  params[:search]
    if @search.blank?   
      redirect_back(fallback_location: root_path, notice: "Search field is empty!!")
    else
      @results = User.search_user(@search)
    end
  end
end