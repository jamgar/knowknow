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

        api_key = JsonWebToken.encode({api_key: @organization.id})
        @organization.update(api_key: api_key)
        sign_in(user)

        format.html { redirect_to account_dashboard_path, notice: "Successfully signed in."}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def organization_params
      params.require(:organization).permit(:name, :subdomain, users_attributes: [:email, :password, :password_confirmation])
    end
end
