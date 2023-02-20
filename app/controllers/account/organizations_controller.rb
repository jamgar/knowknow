class Account::OrganizationsController < AccountController
  before_action :set_organization

  def edit
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to account_documents_path, notice: "Organziation was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity } 
      end
    end 
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:heading, :sub_heading, :background_color, :text_color)
    end
end
