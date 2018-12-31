ActiveRecord::Base.connection.tables.each do |table|
  next if table.match(/\Aschema_migrations\Z/)
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
end

puts 'delete all'

Operation.destroy_all
CompteBancaire.destroy_all
PosteDepense.destroy_all
Budget.destroy_all
SmartSavingRule.destroy_all
Transaction.destroy_all
Cagnotte.destroy_all
User.destroy_all

puts 'Creating db...'

# Creation de l'utilisateur
user = User.create!(
  nom: 'Gueunoun',
  prenom: 'Ruben',
  email: 'ruben.gueunoun@edhec.com',
  password: '123456',
  messenger_id: 1320234228077013,
  profil_depargneur: 'normal'
  )


# Compte bancaire

cb = CompteBancaire.create!(
  user_id: user.id,
  nom_banque: 'BNP Paribas',
  numero_compte: '28203838301123',
  code_acces: '20820821',
  sepa: 'link',
  rib: 'link',
  solde: 822,
  rythme: 3
  )

op1 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '12/01/2018',
  categorie: 'Restaurant',
  libelle: 'La villa',
  montant: 55,
  )
op1.save!

op2 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '10/01/2018',
  categorie: 'Restaurant',
  libelle: 'Villa Rocca',
  montant: 23,
  )
op2.save!

op3 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '09/01/2018',
  categorie: 'Restaurant',
  libelle: 'Le petit Nice',
  montant: 200,
  )
op3.save!

op4 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '23/01/2018',
  categorie: 'Restaurant',
  libelle: 'Otto',
  montant: 43,
  )
op4.save!

op5 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '01/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: 12,
  )
op5.save!

op6 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '14/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: 9,
  )
op6.save!

op7 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '29/01/2018',
  categorie: 'Transport',
  libelle: 'SNCF',
  montant: 80,
  )
op7.save!

op8 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '19/01/2018',
  categorie: 'Sorties',
  libelle: 'R2',
  montant: 50,
  )
op8.save!

op9 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '13/01/2018',
  categorie: 'Sorties',
  libelle: 'Son des guitares',
  montant: 20,
  )
op9.save!

op10 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '06/01/2018',
  categorie: 'Sorties',
  libelle: 'Comptoir d\'endoume',
  montant: 30,
  )
op10.save!


# Cagnottes

c1 = Cagnotte.new(
  user_id: user.id,
  genre: 'depargne',
  montant: 123,
  objectif: 'precaution'
  )
c1.save!

c2 = Cagnotte.new(
  user_id: user.id,
  genre: 'objectif',
  montant: 14,
  objectif: 'air pods'
  )
c2.save!


# Budgets


# Smart saving rules

