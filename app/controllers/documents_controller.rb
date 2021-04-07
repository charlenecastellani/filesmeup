class DocumentsController < ApplicationController

  def index
    @documents = policy_scope(Document)
    @emetteur_requests = @requests.where(emetteur_id: current_user.id)
    @destinataire_requests = @requests.where(destinataire_id: current_user.id)
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

  def valide
    @document = Document.find(params[:id])
    authorize @document
    @document.update(etat_document:"validé")
    redirect_to request_path(@document.request)
  end


  def refuse
    @document = Document.find(params[:id])
    authorize @document
    @document.update(etat_document:"refusé")
    redirect_to request_path(@document.request)
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
