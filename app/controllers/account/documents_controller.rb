class Account::DocumentsController < AccountController
  before_action :set_document, only: %i[ show edit update destroy ]

  def index
    @documents = current_user.documents.all
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to account_doucment_url(@document), notice: "Document was successfully created."}
      else
        format.html { render :new, status: :unprocessable_entity } 
      end
    end 
  end

  def edit
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to account_doucment_url(@document), notice: "Document was successfully updated."}
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to account_documents_url, notice: "Document was successfully delete."}
    end
  end

  private
    def document_params
      params.require(:doucment).permit(:title, :content, :published, :internal)
    end

    def set_document
      @document = Document.friendly.find(params[:id])
    end
end

