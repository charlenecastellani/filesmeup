class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request)
    @emetteur_requests = @requests.where(emetteur_id: current_user.id)
    @doc_a_valider = @emetteur_requests.joins(:documents).where("documents.etat_document = ?", "envoyé").count
    @destinataire_requests = @requests.where(destinataire_id: current_user.id)
   end 

  def show
    @request = Request.find(params[:id])
    authorize @request
  end

end
