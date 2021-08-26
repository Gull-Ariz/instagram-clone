# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_exp

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:user_name, :email, :password, :profile_picture, :account_type_private)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:user_name, :email, :password, :current_password, :profile_picture, :account_type_private)
    end
  end

  def user_not_authorized
    flash[:message] = 'You are not authorized to perform this action.'
    redirect_to authenticated_root_path
  end

  def handle_not_found_exp
    flash[:alert] = 'Not Exits.'
    redirect_to authenticated_root_path
  end
end
