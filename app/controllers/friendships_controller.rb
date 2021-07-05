class FriendshipsController < ApplicationController

  def create
    friend_id = params[:friend_id]
    user_id = current_user.id

    @friend = Friendship.create(friend_id: friend_id, user_id: current_user.id)

    @request = FriendRequest.find_by(user_id: friend_id, req_received_id: user_id) 
    if @request.nil?
      @request = FriendRequest.find_by(user_id: user_id, req_received_id: friend_id) 
    end
    @request.destroy

    redirect_to friend_request_path(current_user)
  end
  
  def destroy
    @friend = Friendship.find_by(friend_id: params[:id], user_id: current_user.id)

    if @friend.nil?
      @friend = Friendship.find_by(friend_id: current_user.id, user_id: params[:id])
    end

    @friend.destroy
    redirect_to friendship_path(current_user)
  end

  def show
    @user = User.find_by(id: params[:id])
    @friends = (@user.friends + @user.inverse_friends)
    @friend_ids = (current_user.friends + current_user.inverse_friends).pluck(:id)
  end

end