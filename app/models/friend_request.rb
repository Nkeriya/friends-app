class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :req_received, class_name: "User"

  validates_uniqueness_of :user_id, scope: :req_received_id
  validates :user_id, :req_received_id, presence: true

end
