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

ActiveRecord::Schema.define(version: 20180330003552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "log_activities", force: :cascade do |t|
    t.float    "per_hour"
    t.float    "amount"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "hours_worked"
    t.float    "bonus"
  end

  add_index "log_activities", ["user_id"], name: "index_log_activities_on_user_id", using: :btree

  create_table "payroll_settings", force: :cascade do |t|
    t.float    "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "surname"
    t.integer  "gender"
    t.datetime "dob"
    t.string   "ni_number"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "postal_code"
    t.string   "city"
    t.string   "home_number"
    t.string   "mobile_number"
    t.datetime "last_signed_in"
    t.integer  "role_id"
    t.datetime "date_joined"
    t.datetime "date_left"
    t.string   "passport_avatar"
    t.string   "job_title"
    t.float    "per_hour"
    t.float    "hour_log"
    t.boolean  "is_active",              default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "log_activities", "users"
end
