class Account::SavedTemplatesController < AccountController
  before_action :set_saved_template, only: %i[ show edit update destroy ]

  def index
    @saved_templates = SavedTemplate.all
  end

  def show
  end

  def new
    @saved_template = SavedTemplate.new
  end

  def create
    @saved_template = SavedTemplate.new(saved_template_params)

    respond_to do |format|
      if @saved_template.save
        format.html { redirect_to account_saved_template_url(@saved_template), notic: "Template was successfully creeted." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @saved_template.update(saved_template_params)
        format.html { redirect_to account_saved_template_url(@saved_template), notice: "Template was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
    @saved_template.destroy

    respond_to do |format|
      format.html { redirect_to account_saved_templates_url, notice: "Template was successfully deleted." }
    end
  end

  private
    def set_saved_template
      @saved_template = SavedTemplate.find(params[:id])
    end

    def saved_template_params
      params.require(:saved_template).permit(:title, :content, :organization_id)
    end
end
