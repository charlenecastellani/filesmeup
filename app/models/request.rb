class Request < ApplicationRecord
  has_many :documents
  belongs_to :destinataire, class_name: :User, foreign_key: :destinataire_id
  belongs_to :emetteur, class_name: :User, foreign_key: :emetteur_id

  def avancement
    total_doc = self.documents.count
    doc_attente = 0
    self.documents.each do |document|
      if document.etat_document == "en attente"
        doc_attente += 1
      end
    end 
    if total_doc >= 1 
      (((total_doc - doc_attente.to_f)/ total_doc) * 100).to_i
    else 
      0
    end
  end
end
