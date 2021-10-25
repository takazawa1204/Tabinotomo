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

ActiveRecord::Schema.define(version: 2021_10_25_073752) do

  create_table "albums", force: :cascade do |t|
    t.integer "itenerary_id"
    t.string "image_id"
    t.text "albums_comment"
    t.string "albums_map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "belongings", force: :cascade do |t|
    t.string "belongings_name"
    t.integer "itenerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "itenerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iteneraries", force: :cascade do |t|
    t.string "edit_password"
    t.string "title"
    t.string "confirmation_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_name"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "itenerary_id"
    t.date "schedules_date"
    t.datetime "schedules_time"
    t.string "schedules_title"
    t.text "schedules_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tagmaps", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "itenerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
