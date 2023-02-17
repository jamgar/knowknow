class PagesController < ApplicationController
  def home
    if current_tenant
      redirect_to documents_path
    end
  end
end
