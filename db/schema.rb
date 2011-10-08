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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111006000200) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "User_name"
    t.integer  "C_votes"
  end

  create_table "lookups", :force => true do |t|
    t.string   "keywords"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes"
    t.integer  "weight"
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "replies", :force => true do |t|
    t.string   "content"
    t.integer  "mid"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "encrypted_password"
    t.boolean  "admin"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
