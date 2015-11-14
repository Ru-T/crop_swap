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

ActiveRecord::Schema.define(version: 20151114210510) do

  create_table "crop_types", force: :cascade do |t|
    t.string   "crop_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crops", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "weight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "crop_pic_file_name"
    t.string   "crop_pic_content_type"
    t.integer  "crop_pic_file_size"
    t.datetime "crop_pic_updated_at"
    t.integer  "crop_type_id"
    t.date     "ripe_on"
    t.date     "expires_on"
  end

  add_index "crops", ["crop_type_id"], name: "index_crops_on_crop_type_id"
  add_index "crops", ["user_id"], name: "index_crops_on_user_id"

  create_table "crops_trade_types", id: false, force: :cascade do |t|
    t.integer "crop_id",       null: false
    t.integer "trade_type_id", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "new"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "trade_type_id"
    t.integer  "crop_id"
    t.integer  "consumer_id"
    t.boolean  "accepted"
    t.text     "message"
    t.text     "message_response"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "crop_pic_file_name"
    t.string   "crop_pic_content_type"
    t.integer  "crop_pic_file_size"
    t.datetime "crop_pic_updated_at"
    t.integer  "grower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "phone_number"
    t.text     "description"
    t.integer  "zip_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "crop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
