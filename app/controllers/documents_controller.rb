class DocumentsController < ApplicationController
  def index
    if user_signed_in? && current_user.organization == current_tenant
      @documents = Document.order("updated_at DESC").where(published: true).or(Document.where(internal: true))
    else
      @documents = Document.order("updated_at DESC").where(published: true, internal: false)
    end

    @documents = @documents.joins(:action_text_rich_text)
      .where("action_text_rich_texts.body Like ?", "%#{params[:query]}%") if params[:query].present?

    @pagy, @documents = pagy(@documents.all, items: 2)
  end

  def show
    @document = Document.friendly.find(params[:id])
  end
end
