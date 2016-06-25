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

ActiveRecord::Schema.define(version: 20160625190046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usergrades", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usergrades", ["grade_id"], name: "index_usergrades_on_grade_id", using: :btree
  add_index "usergrades", ["user_id"], name: "index_usergrades_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "teacher",                default: false
    t.boolean  "substitute",             default: false
    t.boolean  "admin",                  default: false
    t.boolean  "super_admin",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "userschools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "userschools", ["school_id"], name: "index_userschools_on_school_id", using: :btree
  add_index "userschools", ["user_id"], name: "index_userschools_on_user_id", using: :btree

  create_table "usersubjects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usersubjects", ["subject_id"], name: "index_usersubjects_on_subject_id", using: :btree
  add_index "usersubjects", ["user_id"], name: "index_usersubjects_on_user_id", using: :btree

  add_foreign_key "usergrades", "grades"
  add_foreign_key "usergrades", "users"
  add_foreign_key "userschools", "schools"
  add_foreign_key "userschools", "users"
  add_foreign_key "usersubjects", "subjects"
  add_foreign_key "usersubjects", "users"
end
