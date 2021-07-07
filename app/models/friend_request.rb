class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :req_received, class_name: "User"

  validates_uniqueness_of :user_id, scope: :req_received_id
  validates :user_id, :req_received_id, presence: true

  after_create :send_mail_on_create_request

  def send_mail_on_create_request
    SendNotificationJob.set(wait: 1.minutes).perform_later(self, self.req_received)
    # FriendRequestMailer.new_friend_request_email(self, self.req_received).deliver_later(wait: 1.minutes)
  end

end