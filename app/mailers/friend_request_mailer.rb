class FriendRequestMailer < ApplicationMailer
  
  def new_friend_request_email(receiver, sender)
    @receiver = receiver
    @sender_name = sender.name
    email_with_name = %("#{@receiver.user.name}" <#{@receiver.user.email}>)
    @url = "https://rails-friendapp.herokuapp.com"

    mail(to: @receiver.user.email, subject: "You received a friend request!!") do |format|
      format.html { render 'new_friend_request_email' }
      format.text { render 'new_friend_request_email' }
      
    end

  end
end

