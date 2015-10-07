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

ActiveRecord::Schema.define(version: 20150930011239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_names", force: :cascade do |t|
    t.string   "user_name"
    t.integer  "user_id"
    t.boolean  "banned",      default: false
    t.datetime "banned_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_names", ["user_id"], name: "index_user_names_on_user_id", using: :btree
  add_index "user_names", ["user_name", "banned"], name: "index_user_names_on_user_name_and_banned", using: :btree
  add_index "user_names", ["user_name"], name: "index_user_names_on_user_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.integer  "mega_trust_score"
    t.integer  "mega_mod_score"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "user_names", "users"
end
