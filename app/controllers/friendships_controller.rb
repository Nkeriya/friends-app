class FriendshipsController < ApplicationController
  
  def create                           
    @friend = Friendship.new(friendship_params)  # friend_id = params[:friendship][:friend_id]
    if @friend.save
      redirect_to friend_request_path(current_user)
    else
      redirect_back(fallback_location: root_path, notice: "something went wrong!!")
    end
  end
  
  def destroy
    @friend = Friendship.find_by(friend_id: params[:id], user_id: current_user.id)
    if @friend.nil?
      @friend = Friendship.find_by(friend_id: current_user.id, user_id: params[:id])
    end

    @friend.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @user = User.find_by(id: params[:id])
    @friends = (@user.friends + @user.inverse_friends)
  end

  private
  def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id)
  end
end