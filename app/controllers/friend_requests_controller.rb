class FriendRequestsController < ApplicationController
  
  def create
    @request = FriendRequest.create(user_id: params[:user_id], req_received_id: current_user.id) 
    redirect_to users_path(@request)
  end
  
  def destroy
    @request = FriendRequest.find_by(req_received_id: params[:id], user_id: current_user.id) 
    @request.destroy
    redirect_to friend_request_path(current_user)
  end

  def show
    @user = User.find_by(id: params[:id])
    @requests = @user.req_received
  end

  # private
  # def friend_request_params
  #   params.require(:request).permit(:user_id, :req_received_id)
  # end

end
