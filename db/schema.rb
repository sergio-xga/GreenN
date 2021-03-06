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

ActiveRecord::Schema.define(version: 20160909170849) do

  create_table "comments", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.string   "respond",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "topic_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "park_id",     limit: 4
  end

  add_index "events", ["park_id"], name: "index_events_on_park_id", using: :btree

  create_table "marks", id: false, force: :cascade do |t|
    t.integer  "marker_id",     limit: 4
    t.string   "marker_type",   limit: 255
    t.integer  "markable_id",   limit: 4
    t.string   "markable_type", limit: 255
    t.string   "mark",          limit: 128
    t.datetime "created_at"
  end

  add_index "marks", ["markable_id", "markable_type", "mark"], name: "index_marks_on_markable_id_and_markable_type_and_mark", using: :btree
  add_index "marks", ["marker_id", "marker_type", "mark"], name: "index_marks_on_marker_id_and_marker_type_and_mark", using: :btree

  create_table "parks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "ubication",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "community_id", limit: 4
  end

  add_index "parks", ["community_id"], name: "index_parks_on_community_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "park_id",     limit: 4
  end

  add_index "services", ["park_id"], name: "index_services_on_park_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_to_communities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wifi_devices", force: :cascade do |t|
    t.boolean  "alerted"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "park_id",    limit: 4
  end

  add_index "wifi_devices", ["park_id"], name: "index_wifi_devices_on_park_id", using: :btree

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "parks"
  add_foreign_key "parks", "communities"
  add_foreign_key "services", "parks"
  add_foreign_key "topics", "users"
  add_foreign_key "wifi_devices", "parks"
end
