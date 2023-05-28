# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_27_124450) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "adverts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ice_palaces", force: :cascade do |t|
    t.string "title"
    t.string "adress"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "map_script"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id", null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "ice_palace_id", null: false
    t.integer "user_id", null: false
    t.text "weekday"
    t.time "start_time"
    t.time "end_time"
    t.text "section_type"
    t.text "level"
    t.text "goalkeeper_level"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost"
    t.index ["ice_palace_id"], name: "index_sections_on_ice_palace_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "entity_id"
    t.string "entity_type"
    t.boolean "approved", default: false
    t.index ["entity_id", "entity_type"], name: "index_subscriptions_on_entity_id_and_entity_type"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "timetable_units", force: :cascade do |t|
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "weekday", null: false
    t.string "title", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_timetable_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "clubs"
    t.string "metro"
    t.string "avatar"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost"
    t.string "level"
    t.boolean "is_admin", default: false, null: false
    t.boolean "is_goalkeeper", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ratings", "users"
  add_foreign_key "ratings", "users", column: "author_id"
  add_foreign_key "sections", "ice_palaces"
  add_foreign_key "sections", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "timetable_units", "users"
end
