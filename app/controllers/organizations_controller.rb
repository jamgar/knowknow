class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    @organization.users.build
  end

  def create
    @organization = Organization.new(organization_params) 

    respond_to do |format|
      if @organization.save
        user = @organization.users.last
        user.update(role: 1)
        sign_in(user)
        format.html { redirect_to root_path, notice: "Successfully signed in."}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def organization_params
      params.require(:organization).permit(:name, users_attributes: [:email, :password, :password_confirmation])
    end
end
