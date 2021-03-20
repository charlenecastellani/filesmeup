class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :date_creation
      t.datetime :date_echeance
      t.string :statut
      t.string :titre
      t.references :emetteur, references: :users
      t.references :destinataire, references: :users

      t.timestamps
    end
    add_foreign_key :requests, :users, column: :emetteur_id
    add_foreign_key :requests, :users, column: :destinataire_id
  end
end 
