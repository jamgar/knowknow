class Api::V1::DocumentsController < ApiController
 def index
   @documents = Document.all
 end

 def show
   @document = Document.friendly.find(params[:id])
 end
end
