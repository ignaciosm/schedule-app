class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for(resource)
    admin_path(current_admin)
  end
end
