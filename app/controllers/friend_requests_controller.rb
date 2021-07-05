class FriendRequestsController < ApplicationController
  
  def create
  end
  
  def destroy
  end

  def show
    @user = User.find_by(id: params[:id])
    @requests = @user.req_received
  end
  
end
