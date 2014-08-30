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

ActiveRecord::Schema.define(version: 20140830064043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "activities", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.uuid     "trackable_id"
    t.string   "trackable_type"
    t.uuid     "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.uuid     "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "market_food_inventories", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.string   "item_name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_slip_items", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "order_slip_id"
    t.uuid     "product_id"
  end

  create_table "order_slips", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.string   "order_type"
    t.integer  "table_number"
    t.integer  "takeout_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "order_date"
    t.uuid     "user_id"
    t.string   "takeout_type"
  end

  create_table "products", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.string   "item_name"
    t.string   "category"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v1()", force: true do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                               null: false
    t.integer  "status",                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "roles_mask",             default: 0
    t.integer  "age"
    t.date     "birthday"
    t.string   "contact_number"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["roles_mask"], name: "index_users_on_roles_mask", using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
