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

ActiveRecord::Schema.define(version: 20200327151649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clouds", force: :cascade do |t|
    t.string   "key",       limit: 510
    t.string   "size",      limit: 510
    t.string   "mine_type", limit: 510
    t.string   "md5_value", limit: 510
    t.datetime "upload_at"
  end

  create_table "columns", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.string   "english",    limit: 510
    t.string   "icon",       limit: 510
    t.string   "cover",      limit: 510
    t.string   "avatar",     limit: 510, default: ""
    t.text     "summary"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "vip",                    default: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.integer  "reply_id"
    t.integer  "vote"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_action_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action",     limit: 510
    t.string   "result",     limit: 510
    t.string   "local_ip",   limit: 510
    t.string   "location",   limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 510, default: "", null: false
    t.string   "encrypted_password",     limit: 510, default: "", null: false
    t.integer  "role",                               default: 1
    t.string   "reset_password_token",   limit: 510
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 510
    t.string   "last_sign_in_ip",        limit: 510
    t.string   "nick_name",              limit: 510
    t.string   "avatar",                 limit: 510
    t.string   "phone",                  limit: 510
    t.string   "location",               limit: 510
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "users_reset_password_token_key", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "column_id"
    t.string   "url_code",   limit: 510
    t.integer  "recommend",              default: 0
    t.integer  "video_type"
    t.string   "video_url",  limit: 510,             null: false
    t.string   "title",      limit: 510
    t.string   "cover",      limit: 510
    t.string   "duration",   limit: 510
    t.text     "summary"
    t.integer  "view_count", limit: 8,   default: 0
    t.integer  "integer",    limit: 8,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "videos", ["url_code"], name: "videos_url_code_key", unique: true, using: :btree

end
