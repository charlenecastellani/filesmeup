class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :fonction, :string
    add_column :users, :entreprise, :string
  end
end
