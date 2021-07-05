class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  scope :friend_ids, -> (id) {where(user_id: id).pluck(:friend_id)}
  scope :inv_friend_ids, -> (id) {where(friend_id: id).pluck(:user_id)}
end