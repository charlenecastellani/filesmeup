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

  def update
     @document = Document.find(params[:id])
     authorize @document
     if @document.update(document_params)
      @document.etat_document = "envoyé"
      @document.save
      redirect_to request_path(@document.request)
     else
      redirect_to request_path(@document.request)
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @request = @document.request
    @document.destroy

    authorize @document

    redirect_to request_path(@request)
  end

  private

  def document_params
    params.require(:document).permit(:nom, :description, :etat_document, :date_reception, :fichier)
  end


end
