# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(nom: "Dupont", prenom: "Boris", fonction: "DAF", entreprise: "Laboite", email: "bd@laboite.com", password: "orezza")
user2 = User.create(nom: "Martin", prenom: "Bob", fonction: "Auditeur", entreprise: "Lecabinet", email: "bm@lecabinet.com", password: "orezza")

audit1 = Request.create(titre: "Audit comptes 2020", date_echeance: "15/05/2021", date_creation: "20/03/2021", destinataire: user1, emetteur: user2)
audit2 = Request.create(titre: "Audit juridique 2020", date_echeance: "10/06/2021", date_creation: "20/03/2021", destinataire: user2, emetteur: user1)

document1 = Document.create(nom: "Comptes annuels 2020", description: "bilan, compte de résultat et detail des comptes", request: audit1)
document2 = Document.create(nom: "juridique d'approbation des comptes 2020", description: "texte des résolutions, rapport de gestion et convocation", request: audit2)
