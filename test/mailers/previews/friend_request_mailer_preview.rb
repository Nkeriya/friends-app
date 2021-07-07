# Preview all emails at http://localhost:3000/rails/mailers/friend_request_mailer
class FriendRequestMailerPreview < ActionMailer::Preview
  
  def new_friend_request_email
    FriendRequestMailer.new_friend_request_email(obj)
  end

end
