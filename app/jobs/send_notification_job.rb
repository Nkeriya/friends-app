class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(receiver, sender)
    FriendRequestMailer.new_friend_request_email(receiver, sender).deliver_now
  end
end
