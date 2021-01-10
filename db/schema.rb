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

ActiveRecord::Schema.define(version: 20190904221901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", force: :cascade do |t|
    t.string "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ages_products", id: false, force: :cascade do |t|
    t.bigint "age_id", null: false
    t.bigint "product_id", null: false
    t.index ["age_id"], name: "index_ages_products_on_age_id"
    t.index ["product_id"], name: "index_ages_products_on_product_id"
  end

  create_table "attachment_emails", force: :cascade do |t|
    t.string "email"
    t.boolean "on_creation", default: false
    t.boolean "on_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_attached"
    t.string "notes"
    t.bigint "marketing_material_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marketing_material_id"], name: "index_attachments_on_marketing_material_id"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "broadcast_media", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "broadcast_media_products", id: false, force: :cascade do |t|
    t.bigint "broadcast_medium_id", null: false
    t.bigint "product_id", null: false
    t.index ["broadcast_medium_id"], name: "index_broadcast_media_products_on_broadcast_medium_id"
    t.index ["product_id"], name: "index_broadcast_media_products_on_product_id"
  end

  create_table "broadcasting_frequencies", force: :cascade do |t|
    t.string "regularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "durations", force: :cascade do |t|
    t.integer "length_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations_products", id: false, force: :cascade do |t|
    t.bigint "education_id", null: false
    t.bigint "product_id", null: false
    t.index ["education_id"], name: "index_educations_products_on_education_id"
    t.index ["product_id"], name: "index_educations_products_on_product_id"
  end

  create_table "episode_emails", force: :cascade do |t|
    t.string "email"
    t.boolean "on_creation", default: false
    t.boolean "on_update", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "production_company_id"
    t.string "episode_number"
    t.string "po"
    t.string "english_title"
    t.string "arabic_title"
    t.string "topic"
    t.text "description"
    t.string "production_region"
    t.string "first_shooting_date"
    t.boolean "subtitled"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_episodes_on_product_id"
    t.index ["production_company_id"], name: "index_episodes_on_production_company_id"
    t.index ["user_id"], name: "index_episodes_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "attainable_type"
    t.bigint "attainable_id"
    t.bigint "presenter_id"
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attainable_type", "attainable_id"], name: "index_events_on_attainable_type_and_attainable_id"
    t.index ["guest_id"], name: "index_events_on_guest_id"
    t.index ["presenter_id"], name: "index_events_on_presenter_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "identity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders_products", id: false, force: :cascade do |t|
    t.bigint "gender_id", null: false
    t.bigint "product_id", null: false
    t.index ["gender_id"], name: "index_genders_products_on_gender_id"
    t.index ["product_id"], name: "index_genders_products_on_product_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marketing_materials", force: :cascade do |t|
    t.string "name"
    t.string "readiness_date"
    t.string "marketable_type"
    t.bigint "marketable_id"
    t.bigint "material_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attachments_count"
    t.index ["marketable_type", "marketable_id"], name: "index_marketing_materials_on_marketable_type_and_marketable_id"
    t.index ["material_type_id"], name: "index_marketing_materials_on_material_type_id"
    t.index ["user_id"], name: "index_marketing_materials_on_user_id"
  end

  create_table "material_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "viewing_form_id"
    t.string "in"
    t.string "out"
    t.string "duration"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["viewing_form_id"], name: "index_parts_on_viewing_form_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.boolean "can_edit_product", default: false
    t.boolean "can_add_new_episode", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_permissions_on_product_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "presenters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_emails", force: :cascade do |t|
    t.string "email"
    t.boolean "on_creation", default: false
    t.boolean "on_update", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_companies", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_type_id"
    t.bigint "user_id"
    t.bigint "production_company_id"
    t.string "po"
    t.string "logo"
    t.string "english_title"
    t.string "arabic_title"
    t.text "full_description"
    t.string "short_description"
    t.integer "number_of_episodes"
    t.integer "season"
    t.bigint "duration_id"
    t.string "production_region"
    t.string "production_year"
    t.string "broadcasting_year"
    t.string "first_shooting_date"
    t.boolean "subtitled"
    t.bigint "broadcasting_frequency_id"
    t.string "broadcasting_date"
    t.string "broadcasting_time"
    t.string "status"
    t.text "format_and_structure"
    t.text "programme_benchmark"
    t.text "marketing_message_ideas"
    t.bigint "nature_id"
    t.bigint "category_id"
    t.bigint "genre_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broadcasting_frequency_id"], name: "index_products_on_broadcasting_frequency_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["department_id"], name: "index_products_on_department_id"
    t.index ["duration_id"], name: "index_products_on_duration_id"
    t.index ["genre_id"], name: "index_products_on_genre_id"
    t.index ["nature_id"], name: "index_products_on_nature_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["production_company_id"], name: "index_products_on_production_company_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_regions", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "region_id", null: false
    t.index ["product_id"], name: "index_products_regions_on_product_id"
    t.index ["region_id"], name: "index_products_regions_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "can_invite_new_user", default: false
    t.boolean "can_create_product", default: false
    t.boolean "can_view_all_products", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.integer "role_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "viewing_forms", force: :cascade do |t|
    t.bigint "user_id"
    t.string "viewable_type"
    t.bigint "viewable_id"
    t.string "contact_number"
    t.string "programme_id"
    t.string "ingest_date"
    t.string "tx_date"
    t.string "aspect_ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewing_forms_on_user_id"
    t.index ["viewable_type", "viewable_id"], name: "index_viewing_forms_on_viewable_type_and_viewable_id"
  end

  add_foreign_key "attachments", "marketing_materials"
  add_foreign_key "episodes", "production_companies"
  add_foreign_key "episodes", "products"
  add_foreign_key "episodes", "users"
  add_foreign_key "events", "guests"
  add_foreign_key "events", "presenters"
  add_foreign_key "parts", "viewing_forms"
  add_foreign_key "permissions", "products"
  add_foreign_key "permissions", "users"
  add_foreign_key "viewing_forms", "users"
end
