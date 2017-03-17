class AdminsController < ApplicationController
  before_action :authenticate_admin!, :set_admin

  def show
    redirect_to root_path unless @admin.id == current_admin.id
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
end
