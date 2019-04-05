# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_05_142820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.datetime "date"
    t.string "echeance"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "revenu"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "cagnottes", force: :cascade do |t|
    t.datetime "date"
    t.float "montant"
    t.string "objectif"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
    t.float "somme"
    t.index ["user_id"], name: "index_cagnottes_on_user_id"
  end

  create_table "compte_bancaires", force: :cascade do |t|
    t.string "nom_banque"
    t.string "numero_compte"
    t.string "code_acces"
    t.string "sepa"
    t.string "rib"
    t.float "solde"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rythme"
    t.index ["user_id"], name: "index_compte_bancaires_on_user_id"
  end

  create_table "epargnes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "smart_saving_rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "localisation"
    t.index ["smart_saving_rule_id"], name: "index_epargnes_on_smart_saving_rule_id"
    t.index ["user_id"], name: "index_epargnes_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "messenger_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "status"
    t.string "token"
    t.boolean "inscrit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "date"
    t.string "categorie"
    t.string "libelle"
    t.float "montant"
    t.bigint "compte_bancaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "depargne"
    t.index ["compte_bancaire_id"], name: "index_operations_on_compte_bancaire_id"
  end

  create_table "poste_depenses", force: :cascade do |t|
    t.string "categorie"
    t.float "montant"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_poste_depenses_on_budget_id"
  end

  create_table "smart_saving_rules", force: :cascade do |t|
    t.string "nom"
    t.string "mecanisme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "niveau"
  end

  create_table "transactions", force: :cascade do |t|
    t.boolean "retrait"
    t.float "montant"
    t.boolean "automatique"
    t.bigint "cagnotte_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cagnotte_id"], name: "index_transactions_on_cagnotte_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "prenom"
    t.bigint "messenger_id"
    t.string "profil_depargneur"
    t.string "authentication_token", limit: 30
    t.string "registration_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "users"
  add_foreign_key "cagnottes", "users"
  add_foreign_key "compte_bancaires", "users"
  add_foreign_key "epargnes", "smart_saving_rules"
  add_foreign_key "epargnes", "users"
  add_foreign_key "operations", "compte_bancaires"
  add_foreign_key "poste_depenses", "budgets"
  add_foreign_key "transactions", "cagnottes"
end
