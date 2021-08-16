class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :user_name, :email, :password, :profile_picture, :account_type_private ) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :user_name, :email, :password, :profile_picture, :account_type_private ) }
    end
end
