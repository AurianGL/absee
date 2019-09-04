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

ActiveRecord::Schema.define(version: 2019_09_04_083411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "color_swatches", force: :cascade do |t|
    t.string "color_1"
    t.string "color_2"
    t.string "color_3"
    t.string "color_4"
    t.string "color_5"
    t.bigint "version_id"
    t.bigint "artist_as_id"
    t.boolean "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "x"
    t.string "y"
    t.string "size", default: "medium"
    t.boolean "display", default: true
    t.index ["artist_as_id"], name: "index_color_swatches_on_artist_as_id"
    t.index ["version_id"], name: "index_color_swatches_on_version_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "version_id"
    t.bigint "user_id"
    t.text "description"
    t.string "image"
    t.boolean "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "x"
    t.string "y"
    t.string "size", default: "medium"
    t.boolean "display", default: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["version_id"], name: "index_comments_on_version_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.boolean "customer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "portfolio"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "artist_id"
    t.text "brief"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "x"
    t.string "y"
    t.index ["artist_id"], name: "index_projects_on_artist_id"
    t.index ["customer_id"], name: "index_projects_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "project_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "x"
    t.string "y"
    t.string "size", default: "medium"
    t.boolean "display", default: true
    t.index ["project_id"], name: "index_versions_on_project_id"
  end

  add_foreign_key "color_swatches", "users", column: "artist_as_id"
  add_foreign_key "color_swatches", "versions"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "versions"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "users", column: "artist_id"
  add_foreign_key "projects", "users", column: "customer_id"
  add_foreign_key "versions", "projects"
end
