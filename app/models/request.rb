class Request < ApplicationRecord
  has_many :documents
  belongs_to :destinataire, class_name: :User, foreign_key: :destinataire_id
  belongs_to :emetteur, class_name: :User, foreign_key: :emetteur_id
end
