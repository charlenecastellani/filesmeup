class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request)
    @emetteur_requests = @requests.where(emetteur_id: current_user.id)
    @emetteur_requests_en_cours = @emetteur_requests.where(statut = "en cours") 
    @destinataire_requests = @requests.where(destinataire_id: current_user.id)
    @destinataire_requests_en_cours = @destinataire_requests.where(statut = "en cours") 
  end 

  def show
    @request = Request.find(params[:id])
    @document = Document.new
    authorize @request
  end

end
