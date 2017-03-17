class AdminsController < ApplicationController
  before_action :authenticate_admin!, :set_admin

  def show
    redirect_to admin_path(current_admin) if not_your_profile
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def not_your_profile
    @admin.id != current_admin.id
  end
end
