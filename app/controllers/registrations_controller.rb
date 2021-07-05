class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected
  def after_update_path_for(resource)
    user_path(resource)
  end

  # To update without password, 
  # also remove (:password, :current_password) from sanitizer.permit(:account_update) in app's controller   
  # uncomment below method afterwords 

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

end