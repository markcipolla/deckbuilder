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

ActiveRecord::Schema.define(version: 20140930014657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "card_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "card_types", ["slug"], name: "index_card_types_on_slug", unique: true, using: :btree

  create_table "card_types_cards", force: true do |t|
    t.integer "card_type_id"
    t.integer "card_id"
  end

  add_index "card_types_cards", ["card_id"], name: "index_card_types_cards_on_card_id", using: :btree
  add_index "card_types_cards", ["card_type_id"], name: "index_card_types_cards_on_card_type_id", using: :btree

  create_table "cards", force: true do |t|
    t.integer  "faction_id"
    t.integer  "deck_id"
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.integer  "identity_id"
    t.integer  "data_pack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_influence"
    t.integer  "deck_minimum_cards"
    t.integer  "influence"
    t.integer  "strength"
    t.integer  "memory_units"
    t.integer  "advancement_cost"
    t.integer  "agenda_point"
    t.integer  "trash_cost"
    t.integer  "link"
    t.string   "image_id"
    t.string   "slug"
  end

  add_index "cards", ["data_pack_id"], name: "index_cards_on_data_pack_id", using: :btree
  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  add_index "cards", ["faction_id"], name: "index_cards_on_faction_id", using: :btree
  add_index "cards", ["identity_id"], name: "index_cards_on_identity_id", using: :btree
  add_index "cards", ["slug"], name: "index_cards_on_slug", unique: true, using: :btree

  create_table "cards_decks", force: true do |t|
    t.integer "card_id"
    t.integer "deck_id"
  end

  add_index "cards_decks", ["card_id"], name: "index_cards_decks_on_card_id", using: :btree
  add_index "cards_decks", ["deck_id"], name: "index_cards_decks_on_deck_id", using: :btree

  create_table "data_packs", force: true do |t|
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "box"
    t.string   "name"
    t.string   "slug"
  end

  add_index "data_packs", ["slug"], name: "index_data_packs_on_slug", unique: true, using: :btree

  create_table "deck_cards", force: true do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "number"
  end

  add_index "deck_cards", ["card_id"], name: "index_deck_cards_on_card_id", using: :btree
  add_index "deck_cards", ["deck_id", "card_id"], name: "index_deck_cards_on_deck_id_and_card_id", unique: true, using: :btree
  add_index "deck_cards", ["deck_id"], name: "index_deck_cards_on_deck_id", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "faction_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "identity_card_id"
  end

  add_index "decks", ["faction_id"], name: "index_decks_on_faction_id", using: :btree
  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "factions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "factions", ["slug"], name: "index_factions_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "faction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

  add_index "identities", ["faction_id"], name: "index_identities_on_faction_id", using: :btree
  add_index "identities", ["slug"], name: "index_identities_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
