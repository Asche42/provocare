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

ActiveRecord::Schema.define(version: 20150922212155) do

  create_table "articles", force: true do |t|
    t.text     "content",     null: false
    t.string   "title",       null: false
    t.string   "subtitle",    null: false
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "comments", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.text     "content",    null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "offers", force: true do |t|
    t.integer  "offer_type", default: 0, null: false
    t.integer  "user_id"
    t.string   "company"
    t.string   "title",                  null: false
    t.text     "content",                null: false
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "firstname",              default: "",    null: false
    t.string   "lastname",               default: "",    null: false
    t.date     "birthdate"
    t.boolean  "admin",                  default: false, null: false
    t.integer  "status",                 default: 0,     null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "job"
    t.string   "company"
    t.integer  "promotion"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "description"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
