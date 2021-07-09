module DestroyFriendReq
  extend ActiveSupport::Concern

  def destroy_friend_req
    request = FriendRequest.find_by(user_id: friend_id, req_received_id: user_id) 
    if request.nil?
      request = FriendRequest.find_by(user_id: user_id, req_received_id: friend_id) 
    end
    request.destroy
  end
end