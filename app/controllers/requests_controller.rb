class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request)
    @emetteur_requests = @requests.where(emetteur_id: current_user.id)
    @doc_a_valider = @emetteur_requests.joins(:documents).where("documents.etat_document = ?", "envoyé").count
    @destinataire_requests = @requests.where(destinataire_id: current_user.id)
    @doc_refuse = @destinataire_requests.joins(:documents).where("documents.etat_document = ?", "refusé").count
   end 

  def show
    @request = Request.find(params[:id])
    @document = Document.new
    authorize @request
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.emetteur_id = current_user.id
    @request.save
  
    authorize @request
    redirect_to request_path(@request)
  end
  
  private
  
  def request_params
    params.require(:request).permit(:titre, :date_creation, :date_echeance, :destinataire_id )
  end

end

