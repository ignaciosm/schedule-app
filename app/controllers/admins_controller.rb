class AdminsController < ApplicationController
  before_action :authenticate_admin!, :assign_employee

  def show
    redirect_to admin_path(current_admin) if not_your_profile
  end

  private
  def assign_employee
    @admin = Admin.find(params[:id])
  end

  def not_your_profile
    @admin.id != current_admin.id
  end
end
