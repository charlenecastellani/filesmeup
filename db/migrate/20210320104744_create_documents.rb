class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :nom
      t.string :description
      t.string :etat_document, default:"en attente"
      t.datetime :date_reception
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
