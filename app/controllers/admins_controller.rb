class AdminsController < ApplicationController
  before_action :authenticate_admin!, :set_admin

  def show
    redirect_to admin_path(current_admin) unless @admin.id == current_admin.id
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
end
