class AdminsController < ApplicationController
  before_action :authenticate_admin!, :set_admin

  def show
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
end
