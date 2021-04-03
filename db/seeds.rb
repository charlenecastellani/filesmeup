# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


Document.destroy_all
Request.destroy_all
User.destroy_all

file = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80')

user1 = User.create(nom: "Dupont", prenom: "Boris", fonction: "DAF", entreprise: "Laboite", email: "bd@laboite.com", password: "orezza")
user2 = User.create(nom: "Martin", prenom: "Bob", fonction: "Auditeur", entreprise: "Lecabinet", email: "bm@lecabinet.com", password: "orezza")
user3 = User.create(nom: "Aubert", prenom: "Bruno", fonction: "Expert-comptable", entreprise: "The New Cab", email: "ba@thecab.com", password: "orezza")
user4 = User.create(nom: "Marin", prenom: "Jean", fonction: "Auditeur", entreprise: "AuditRocket", email: "jm@auditrocket.com", password: "orezza")
user5 = User.new(nom: "Briche", prenom: "Victorine", fonction: "DRH", entreprise: "Laboite", email: "vb@laboite.com", password: "orezza")
user5.photo.attach(io: file, filename: 'victorine.jpg', content_type: 'image/jpg')
user5.save

user6 = User.create(nom: "Poutoux", prenom: "Chantal", fonction: "PDG", entreprise: "Laboite", email: "cp@laboite.com", password: "orezza")
user7 = User.create(nom: "Sorro", prenom: "Rose", fonction: "Chef comptable", entreprise: "Thecompany", email: "rs@thecompany.com", password: "orezza")
user8 = User.create(nom: "Aniorte", prenom: "Luc", fonction: "RAF", entreprise: "BBest", email: "la@bbest.com", password: "orezza")

audit1 = Request.create(titre: "Audit comptes 2020", date_echeance: "15/05/2021", date_creation: "20/03/2021", destinataire: user1, emetteur: user2)
audit2 = Request.create(titre: "Audit juridique 2020", date_echeance: "10/06/2021", date_creation: "20/03/2021", destinataire: user3, emetteur: user2)
audit3 = Request.create(titre: "Audit social 2020", date_echeance: "15/05/2021", date_creation: "20/03/2021", destinataire: user5, emetteur: user2)
audit4 = Request.create(titre: "Audit comptes 2020", date_echeance: "30/04/2021", date_creation: "10/03/2021", destinataire: user7, emetteur: user2)
audit5 = Request.create(titre: "Audit comptes 2020", date_echeance: "31/05/2021", date_creation: "27/03/2021", destinataire: user8, emetteur: user2)
audit6 = Request.create(titre: "Revue filiales 2020", date_echeance: "15/04/2021", date_creation: "02/03/2021", destinataire: user2, emetteur: user4)

document1 = Document.create(nom: "Comptes annuels 2020", description: "bilan, compte de résultat et detail des comptes", request: audit1, etat_document: "reçu")
document2 = Document.create(nom: "Texte des résolutions", description: "Juridique d'approbation des comptes 2020", request: audit2, etat_document: "reçu" )
document3 = Document.create(nom: "Rapport de gestion", description: "Juridique d'approbation des comptes 2020", request: audit2)
document4 = Document.create(nom: "Convocation", description: "juridique d'approbation des comptes 2020", request: audit2)
document5 = Document.create(nom: "conventions règlementées", description: "courrier d'information sur les conventions règlementées au 31/12/2020", request: audit2)
document6 = Document.create(nom: "Etat des immobilisations au 31/12/2020", description: "Immobilisations, dotations aux amortissements et VNC", request: audit1)
document7 = Document.create(nom: "Relevé bancaire de décembre BNP", description: "Dernier releve bancaire de l'exercice faisant apparaitre le solde au 31/12/2020", request: audit1, etat_document: "reçu")
document8 = Document.create(nom: "Tableau d'amortissement emprunt BNP", description: "Echeancier en cours sur le nouvel emprunt", request: audit1)
document9 = Document.create(nom: "Contrat emprunt BNP", description: "Contrat nouvel emprunt BNP", request: audit1)
document10 = Document.create(nom: "Inventaire au 31/12/2020", description: "Inventaire du stock au 31/12/2020 signé par le dirigeant", request: audit1, etat_document: "reçu")
document11 = Document.create(nom: "Livre de paie 2020", description: "Récapitulatif de paie en cumul du 1er janvier au 31 décembre 2020", request: audit3)
document12 = Document.create(nom: "DSN décembre 2020", description: "Dernière DSN de l'exercice", request: audit3)
document13 = Document.create(nom: "Etat des CP au 31/12/2020", description: "Solde détaillé des CP par salarié au 31/12/2020", request: audit3)
document14 = Document.create(nom: "Balance générale au 31/12/2020", description: "Balance générale à jour suite modif au format excel avec comparatif n-1", request: audit4, etat_document: "reçu")
document15 = Document.create(nom: "Grand-livre général au 31/12/2020", description: "Grand-livre général à jour suite modif au format excel", request: audit4)
document16 = Document.create(nom: "comptes annuels 2020", description: "Bilan, compte de résultat et detail des comptes", request: audit5)
document17 = Document.create(nom: "Balance générale au 31/12/2020", description: "Balance générale au format excel", request: audit5)
document18 = Document.create(nom: "Rapport sur les comptes annuels 2019 de la société Laboite", description: "Rapport que vous avez émis pour la société Laboite, filiale de la société Thebigboite", request: audit6)
