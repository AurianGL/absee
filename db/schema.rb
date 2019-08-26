ActiveRecord::Schema.define(version: 2019_08_26_132536) do

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
    t.index ["artist_as_id"], name: "index_color_swatches_on_artist_as_id"
    t.index ["version_id"], name: "index_color_swatches_on_version_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "version_id"
    t.bigint "user_id"
    t.text "description"
    t.string "image_url"
    t.boolean "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["version_id"], name: "index_comments_on_version_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "artist_id"
    t.text "brief"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "work_in_progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_versions_on_project_id"
  end

  add_foreign_key "color_swatches", "users", column: "artist_as_id"
  add_foreign_key "color_swatches", "versions"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "versions"
  add_foreign_key "projects", "users", column: "artist_id"
  add_foreign_key "projects", "users", column: "customer_id"
  add_foreign_key "versions", "projects"
end
