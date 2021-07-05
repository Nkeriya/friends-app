class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates_uniqueness_of :user_id, scope: :friend_id, on: :create
  
  validates :user_id, :friend_id, presence: true
 
  scope :friend_ids, -> (id) {where(user_id: id).pluck(:friend_id)}
  scope :inv_friend_ids, -> (id) {where(friend_id: id).pluck(:user_id)}
end