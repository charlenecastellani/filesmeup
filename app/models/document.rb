class Document < ApplicationRecord
  belongs_to :request
  has_one_attached :fichier
end
