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

ActiveRecord::Schema.define(version: 2022_06_21_235650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_items", force: :cascade do |t|
    t.integer "list_id"
    t.string "task"
    t.string "description"
    t.string "status"
    t.text "details"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "multi_unit", null: false
    t.integer "property_type", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "investment_type"
    t.index ["multi_unit"], name: "index_properties_on_multi_unit"
    t.index ["property_type"], name: "index_properties_on_property_type"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_addresses", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "state_id", null: false
    t.string "street1", null: false
    t.string "street2"
    t.string "city", null: false
    t.string "zip", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_property_addresses_on_city"
    t.index ["property_id"], name: "index_property_addresses_on_property_id"
    t.index ["state_id"], name: "index_property_addresses_on_state_id"
    t.index ["zip"], name: "index_property_addresses_on_zip"
  end

  create_table "service_tags", force: :cascade do |t|
    t.integer "service_id"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbr", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbr"], name: "index_states_on_abbr"
  end

  create_table "supports", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "reason"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "name", null: false
    t.string "bed", null: false
    t.string "bath", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
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

  create_table "vendor_addresses", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "state_id", null: false
    t.string "street1"
    t.string "street2"
    t.string "city", null: false
    t.string "zip", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_vendor_addresses_on_city"
    t.index ["state_id"], name: "index_vendor_addresses_on_state_id"
    t.index ["zip"], name: "index_vendor_addresses_on_zip"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "company_name"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "website"
    t.text "note"
    t.index ["email"], name: "index_vendors_on_email"
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

end
