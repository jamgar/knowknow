class DocumentsController < ApplicationController
  def index
    if user_signed_in? && current_user.organization == current_tenant
      @documents = Document.order("updated_at DESC").where(published: true).or(Document.where(internal: true))
    else
      @documents = Document.order("updated_at DESC").where(published: true, internal: false)
    end

    @documents
  end

  def show
    @document = Document.friendly.find(params[:id])
  end
end
