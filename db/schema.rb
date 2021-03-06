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

ActiveRecord::Schema.define(version: 20160430005842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string   "planet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_packages", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_packages", ["order_id"], name: "index_order_packages_on_order_id", using: :btree
  add_index "order_packages", ["package_id"], name: "index_order_packages_on_package_id", using: :btree
  add_index "order_packages", ["user_id"], name: "index_order_packages_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "user_id"
    t.string   "status"
    t.string   "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.string   "price"
    t.string   "description"
    t.string   "destination_id"
    t.string   "status"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "password_confirmation"
    t.string   "role",                  default: "0"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_foreign_key "order_packages", "orders"
  add_foreign_key "order_packages", "packages"
  add_foreign_key "order_packages", "users"
end
