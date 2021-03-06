# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_21_093905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auditoriums", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "available_seats", force: :cascade do |t|
    t.bigint "show_time_id"
    t.bigint "order_id"
    t.string "row_letter"
    t.string "column_number"
    t.float "base_price"
    t.boolean "was_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_available_seats_on_order_id"
    t.index ["show_time_id"], name: "index_available_seats_on_show_time_id"
  end

  create_table "black_lists", force: :cascade do |t|
    t.string "value"
    t.string "black_list_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "creation_year"
    t.float "price_per_seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "show_time_id"
    t.string "name"
    t.string "email"
    t.integer "credit_card_number"
    t.date "expiration_date"
    t.float "added_price"
    t.float "taxes"
    t.float "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_time_id"], name: "index_orders_on_show_time_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "full_name"
    t.string "current_job_title"
    t.string "linkedin_profile"
    t.string "email"
    t.string "mobile_number"
    t.datetime "pertinent_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "samples", force: :cascade do |t|
    t.string "title", null: false
    t.string "sub_title", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "auditorium_id"
    t.string "row_letter"
    t.string "column_number"
    t.float "base_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auditorium_id"], name: "index_seats_on_auditorium_id"
  end

  create_table "show_times", force: :cascade do |t|
    t.bigint "auditorium_id"
    t.bigint "movie_id"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.string "movie_title"
    t.string "movie_genre"
    t.float "price_per_seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auditorium_id"], name: "index_show_times_on_auditorium_id"
    t.index ["movie_id"], name: "index_show_times_on_movie_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "order_id"
    t.string "serial"
    t.datetime "begin_date"
    t.string "cinema_name"
    t.string "auditorium_name"
    t.float "total_price"
    t.string "movie_title"
    t.string "seats_string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_tickets_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "available_seats", "orders"
  add_foreign_key "available_seats", "show_times"
  add_foreign_key "orders", "show_times"
  add_foreign_key "seats", "auditoriums"
  add_foreign_key "show_times", "auditoriums"
  add_foreign_key "show_times", "movies"
  add_foreign_key "tickets", "orders"
end
