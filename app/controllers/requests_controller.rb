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

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(params[:request])
    redirect_to request_path(@request)
  end

end
