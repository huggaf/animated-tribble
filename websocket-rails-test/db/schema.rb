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

ActiveRecord::Schema.define(version: 20140214232031) do

  create_table "order_items", force: true do |t|
    t.integer  "order_id",                                          null: false
    t.integer  "product_id",                                        null: false
    t.integer  "amount",                              default: 1,   null: false
    t.decimal  "value",      precision: 15, scale: 2, default: 0.0, null: false
    t.decimal  "total",      precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: true do |t|
    t.integer  "user_id",                     null: false
    t.string   "status",     default: "open", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["status"], name: "index_orders_on_status"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: true do |t|
    t.string   "name",                                              null: false
    t.decimal  "price",      precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["name"], name: "index_products_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
