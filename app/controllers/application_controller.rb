class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

    #   def after_sign_in_path_for(user)
    #   admin_index_path(current_user)

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :email] if resource_name == :admin
    attributes = [:first_name, :last_name, :email] if resource_name == :user
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
