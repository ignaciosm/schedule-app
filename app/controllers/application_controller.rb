class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,
                :configure_permitted_update_parameters,
                if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company])
  end

  def configure_permitted_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company])
  end

  private
  def after_sign_in_path_for(resource)
    admin_path(current_admin)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
