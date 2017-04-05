# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170405010500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employes", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "adresse"
    t.integer  "cell"
    t.integer  "maison"
    t.integer  "bureau"
    t.string   "courriel"
    t.text     "formation"
    t.integer  "organisme_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "role_id"
  end

  add_index "employes", ["role_id"], name: "index_employes_on_role_id", using: :btree

  create_table "organismes", force: :cascade do |t|
    t.string   "nom"
    t.integer  "api_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employes", "roles"
end
