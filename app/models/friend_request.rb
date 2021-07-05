class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :req_received, class_name: "User"

end
