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
  email: 'ruben.gueunoun@test.com',
  password: '123456',
  messenger_id: 1320234228077013,
  profil_depargneur: 'normal',
  pause: false,
  admin: true
  )

#1320234228077013

# Compte bancaire

cb = CompteBancaire.create!(
  user_id: user.id,
  nom_banque: 'BNP Paribas',
  numero_compte: '28203838301123',
  solde: 2849.33,
  rythme: 3
  )

op1 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '12/01/2018',
  categorie: 'Restaurant',
  libelle: 'La villa',
  montant: -55,
  depargne: true,
  )
op1.save!

op2 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '10/01/2018',
  categorie: 'Restaurant',
  libelle: 'Villa Rocca',
  montant: -23.10,
  depargne: true,
  )
op2.save!

op3 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '09/01/2018',
  categorie: 'Restaurant',
  libelle: 'Le petit Nice',
  montant: -200,
  depargne: true,
  )
op3.save!

op4 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '23/01/2018',
  categorie: 'Restaurant',
  libelle: 'Otto',
  montant: -43.50,
  depargne: true,
  )
op4.save!

op5 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '01/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: -12.37,
  depargne: true,
  )
op5.save!

op6 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '14/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: -9.70,
  depargne: true,
  )
op6.save!

op7 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '29/01/2018',
  categorie: 'Transport',
  libelle: 'SNCF',
  montant: -79.99,
  depargne: true,
  )
op7.save!

op11 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '30/01/2018',
  categorie: 'Virement',
  libelle: 'Cadeau Papa',
  montant: 400,
  depargne: true,
  )
op11.save!

op8 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '19/01/2018',
  categorie: 'Sorties',
  libelle: 'R2',
  montant: -50,
  depargne: true,
  )
op8.save!

op9 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '13/01/2018',
  categorie: 'Sorties',
  libelle: 'Son des guitares',
  montant: -20,
  depargne: true,
  )
op9.save!

op10 = Operation.new(
  compte_bancaire_id: cb.id,
  date: '06/01/2018',
  categorie: 'Sorties',
  libelle: 'Comptoir d\'endoume',
  montant: -30,
  depargne: true,
  )
op10.save!


# Cagnottes

c1 = Cagnotte.new(
  user_id: user.id,
  genre: 'depargne',
  montant: 53.45,
  objectif: 'precaution',
  somme: 0
  )
c1.save!

c2 = Cagnotte.new(
  user_id: user.id,
  genre: 'objectif',
  montant: 103.03,
  objectif: 'air pods',
  somme: 189.00
  )
c2.save!


# transactions

t1 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 4.23,
  automatique: true
  )
t1.save!

t2 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 8.21,
  automatique: true
  )
t2.save!

t3 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 2.45,
  automatique: true
  )
t3.save!

t4 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 7.56,
  automatique: true
  )
t4.save!

t5 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 20.00,
  automatique: false
  )
t5.save!

t6 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 6.86,
  automatique: true
  )
t6.save!

t7 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 7.74,
  automatique: true
  )
t7.save!

t8 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: true,
  montant: 40.00,
  automatique: false
  )
t8.save!

t9 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 5.98,
  automatique: true
  )
t9.save!

t10 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 2.44,
  automatique: true
  )
t10.save!

t11 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 4.20,
  automatique: true
  )
t11.save!

t12 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 9.23,
  automatique: true
  )
t12.save!

t13 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 6.33,
  automatique: true
  )
t13.save!

t14 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 4.93,
  automatique: true
  )
t14.save!

t15 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 3.29,
  automatique: true
  )
t15.save!

t16 = Transaction.new(
  cagnotte_id: c1.id,
  retrait: false,
  montant: 14.23,
  automatique: true
  )
t16.save!

t17 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 8.21,
  automatique: true
  )
t17.save!

t18 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 12.45,
  automatique: true
  )
t18.save!

t19 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 7.56,
  automatique: true
  )
t19.save!

t20 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 20.00,
  automatique: false
  )
t20.save!

t21 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 6.86,
  automatique: true
  )
t21.save!

t22 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 7.74,
  automatique: true
  )
t22.save!

t23 = Transaction.new(
  cagnotte_id: c2.id,
  retrait: false,
  montant: 25.98,
  automatique: true
  )
t23.save!


# Budgets






# Creation de l'utilisateur Toub
user1 = User.create!(
  nom: 'Touboul',
  prenom: 'Benjamin',
  email: 'bentoub@gmail.com',
  password: '123456',
  messenger_id: 2047709478577132,
  profil_depargneur: 'normal',
  pause: false
  )


# Compte bancaire

cb1 = CompteBancaire.create!(
  user_id: user1.id,
  nom_banque: 'Bank B',
  numero_compte: '28203838301123',
  solde: 822.33,
  rythme: 3
  )

op120 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '12/01/2018',
  categorie: 'Restaurant',
  libelle: 'La villa',
  montant: -55,
  depargne: true,
  )
op120.save!

op12 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '10/01/2018',
  categorie: 'Restaurant',
  libelle: 'Villa Rocca',
  montant: -23.10,
  depargne: true,
  )
op12.save!

op13 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '09/01/2018',
  categorie: 'Restaurant',
  libelle: 'Le petit Nice',
  montant: -200,
  depargne: true,
  )
op13.save!

op14 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '23/01/2018',
  categorie: 'Restaurant',
  libelle: 'Otto',
  montant: -43.50,
  depargne: true,
  )
op14.save!

op15 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '01/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: -12.37,
  depargne: true,
  )
op15.save!

op16 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '14/01/2018',
  categorie: 'Transport',
  libelle: 'Uber',
  montant: -9.70,
  depargne: true,
  )
op16.save!

op17 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '29/01/2018',
  categorie: 'Transport',
  libelle: 'SNCF',
  montant: -79.99,
  depargne: true,
  )
op17.save!

op1100 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '30/01/2018',
  categorie: 'Virement',
  libelle: 'Cadeau Papa',
  montant: 400,
  depargne: true,
  )
op1100.save!

op18 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '19/01/2018',
  categorie: 'Sorties',
  libelle: 'R2',
  montant: -50,
  depargne: true,
  )
op18.save!

op19 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '13/01/2018',
  categorie: 'Sorties',
  libelle: 'Son des guitares',
  montant: -20,
  depargne: true,
  )
op19.save!

op21 = Operation.new(
  compte_bancaire_id: cb1.id,
  date: '06/01/2018',
  categorie: 'Sorties',
  libelle: 'Comptoir d\'endoume',
  montant: -30,
  depargne: true,
  )
op21.save!


# Cagnottes

c3 = Cagnotte.new(
  user_id: user1.id,
  genre: 'depargne',
  montant: 53.45,
  objectif: 'precaution',
  somme: 0
  )
c3.save!

c4 = Cagnotte.new(
  user_id: user1.id,
  genre: 'objectif',
  montant: 103.03,
  objectif: 'air pods',
  somme: 189.00
  )
c4.save!


# transactions

t101 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 4.23,
  automatique: true
  )
t101.save!

t201 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 8.21,
  automatique: true
  )
t201.save!

t301 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 2.45,
  automatique: true
  )
t301.save!

t401 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 7.56,
  automatique: true
  )
t401.save!

t501 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 20.00,
  automatique: false
  )
t501.save!

t601 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 6.86,
  automatique: true
  )
t601.save!

t701 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 7.74,
  automatique: true
  )
t701.save!

t801 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: true,
  montant: 40.00,
  automatique: false
  )
t801.save!

t901 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 5.98,
  automatique: true
  )
t901.save!

t1001 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 2.44,
  automatique: true
  )
t1001.save!

t1101 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 4.20,
  automatique: true
  )
t1101.save!

t1201 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 9.23,
  automatique: true
  )
t1201.save!

t1301 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 6.33,
  automatique: true
  )
t1301.save!

t1401 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 4.93,
  automatique: true
  )
t1401.save!

t1501 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 3.29,
  automatique: true
  )
t1501.save!

t1601 = Transaction.new(
  cagnotte_id: c3.id,
  retrait: false,
  montant: 14.23,
  automatique: true
  )
t1601.save!

t1701 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 8.21,
  automatique: true
  )
t1701.save!

t1801 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 12.45,
  automatique: true
  )
t1801.save!

t1901 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 7.56,
  automatique: true
  )
t1901.save!

t2001 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 20.00,
  automatique: false
  )
t2001.save!

t2101 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 6.86,
  automatique: true
  )
t2101.save!

t2201 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 7.74,
  automatique: true
  )
t2201.save!

t2301 = Transaction.new(
  cagnotte_id: c4.id,
  retrait: false,
  montant: 25.98,
  automatique: true
  )
t2301.save!


# Budgets

# Choix d'un ssr par un user


# Smart saving rules

ssr1 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "faible",
  mecanisme: "simple"
  )
ssr1.save!

ssr2 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "moyen",
  mecanisme: "simple"
  )
ssr2.save!

ssr3 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "fort",
  mecanisme: "simple"
  )
ssr3.save!

ssr4 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "faible",
  mecanisme: "intelligent"
  )
ssr4.save!

ssr5 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "moyen",
  mecanisme: "intelligent"
  )
ssr5.save!

ssr6 = SmartSavingRule.new(
  nom: "dépargne",
  niveau: "fort",
  mecanisme: "intelligent"
  )
ssr6.save!

ssr7 = SmartSavingRule.new(
  nom: "météo",
  niveau: "5",
  mecanisme: "dimanche"
  )
ssr7.save!

ssr8 = SmartSavingRule.new(
  nom: "météo",
  niveau: "10",
  mecanisme: "dimanche"
  )
ssr8.save!

ssr9 = SmartSavingRule.new(
  nom: "météo",
  niveau: "5",
  mecanisme: "samedi"
  )
ssr9.save!

ssr10 = SmartSavingRule.new(
  nom: "météo",
  niveau: "10",
  mecanisme: "samedi"
  )
ssr10.save!

ssr11 = SmartSavingRule.new(
  nom: "météo",
  niveau: "15",
  mecanisme: "samedi"
  )
ssr11.save!

ssr12 = SmartSavingRule.new(
  nom: "météo",
  niveau: "15",
  mecanisme: "dimanche"
  )
ssr12.save!

ssr13 = SmartSavingRule.new(
  nom: "cigarette",
  niveau: "1",
  mecanisme: "jour"
  )
ssr13.save!

ssr14 = SmartSavingRule.new(
  nom: "cigarette",
  niveau: "2",
  mecanisme: "jour"
  )
ssr14.save!

ssr15 = SmartSavingRule.new(
  nom: "cigarette",
  niveau: "3",
  mecanisme: "jour"
  )
ssr15.save!

ssr16 = SmartSavingRule.new(
  nom: "virement",
  niveau: "2",
  mecanisme: "pourcentage"
  )
ssr16.save!

ssr17 = SmartSavingRule.new(
  nom: "virement",
  niveau: "3",
  mecanisme: "pourcentage"
  )
ssr17.save!

ssr18 = SmartSavingRule.new(
  nom: "virement",
  niveau: "5",
  mecanisme: "pourcentage"
  )
ssr18.save!

ssr19 = SmartSavingRule.new(
  nom: "virement",
  niveau: "10",
  mecanisme: "fixe"
  )
ssr19.save!

ssr20 = SmartSavingRule.new(
  nom: "virement",
  niveau: "20",
  mecanisme: "fixe"
  )
ssr20.save!


# Choix d'un ssr par un user
epargne1 = Epargne.new(
  user_id: user.id,
  smart_saving_rule_id: ssr1.id
  )
epargne1.save!

epargne2 = Epargne.new(
  user_id: user1.id,
  smart_saving_rule_id: ssr1.id
  )
epargne1.save!


puts "All done"
