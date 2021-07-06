class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :username, :firstname, :lastname, :birthday, :gender )}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :username, :firstname, :lastname, :birthday, :gender, :profile_image)}
  end

  def after_sign_in_path_for(resource)
    users_path
  end

end