class Friendship < ApplicationRecord
  include DestroyFriendReq
  
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates_uniqueness_of :user_id, scope: :friend_id, on: :create
  validates :user_id, :friend_id, presence: true
  
  after_create :destroy_friend_req

end