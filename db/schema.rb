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

ActiveRecord::Schema.define(version: 20160502122416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_projects", force: :cascade do |t|
    t.string   "admin",      null: false
    t.string   "title",      null: false
    t.string   "group_name"
    t.date     "deadline"
    t.boolean  "public"
    t.text     "link"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "user_name"
    t.string   "groupname"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "verified_by_user"
  end

  create_table "my_groups", force: :cascade do |t|
    t.string   "groupname"
    t.string   "admin",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_groups", ["groupname"], name: "unique_group_name", unique: true, using: :btree

  create_table "user_details", primary_key: "username", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest", null: false
  end

  add_foreign_key "add_projects", "user_details", column: "admin", primary_key: "username", name: "admin_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "groups", "my_groups", column: "groupname", primary_key: "groupname", name: "group_to_my_group_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "groups", "user_details", column: "user_name", primary_key: "username", name: "group_user_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "my_groups", "user_details", column: "admin", primary_key: "username", name: "my_group_admin_fkey", on_update: :cascade, on_delete: :cascade
end
