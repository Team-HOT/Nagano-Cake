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

ActiveRecord::Schema.define(version: 2020_01_18_102542) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "end_user_id"
    t.integer "quentity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "delivery_name1"
    t.string "delivery_name2"
    t.string "delivery_name3"
    t.string "delivery_name4"
    t.text "delivery_address"
    t.string "delivery_post"
    t.string "delivery_number"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name1"
    t.string "name2"
    t.string "name3"
    t.string "name4"
    t.text "address"
    t.string "post"
    t.string "number"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_end_users_on_deleted_at"
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "order_item_price"
    t.string "order_item_name"
    t.string "production_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "postage"
    t.string "order_status"
    t.integer "quantity"
    t.integer "total_fee"
    t.integer "end_user_id"
    t.integer "delively_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment"
    t.string "delivery_name"
    t.text "Delivery_address"
    t.integer "Delivery_post"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "product_category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_category_status"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "product_body"
    t.string "product_image_id"
    t.integer "product_category_id"
    t.string "sale_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
