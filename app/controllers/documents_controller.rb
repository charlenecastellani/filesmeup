class DocumentsController < ApplicationController

  def index
    @documents = policy_scope(Document)
  end

  def new
    @document = Document.new
    @request = Request.find(params[:request_id])
    authorize @document
  end

  def create
    @request = Request.find(params[:request_id])
    @document = Document.new(document_params)
    @document.request = @request
    authorize @document
    @document.save
    
    redirect_to request_path(@request)
  end
  
  private
  
  def document_params
    params.require(:document).permit(:nom, :description, :etat_document, :date_reception )
  end


end
