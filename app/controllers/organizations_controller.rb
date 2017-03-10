class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show]
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      flash[:success] = 'You have successfully created your organization'
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def show
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :email, :organizer,
                                         :password, :password_digest)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
