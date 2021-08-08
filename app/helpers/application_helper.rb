module ApplicationHelper
 
  def full_name(user)
    "@" + user.firstname.capitalize
  end

end
