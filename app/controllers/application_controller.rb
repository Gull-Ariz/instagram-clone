class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :user_name, :email, :password, :profile_picture, :account_type_private ) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :user_name, :email, :password, :profile_picture, :account_type_private ) }
    end

    def user_not_authorized
      flash[:message] = "You are not authorized to perform this action."
      redirect_to authenticated_root_path
    end
end
