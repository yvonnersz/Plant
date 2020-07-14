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

ActiveRecord::Schema.define(version: 2020_07_14_022707) do

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.integer "cash"
    t.integer "prestige"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "indoor_plants", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "store_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_indoor_plants_on_customer_id"
    t.index ["store_id"], name: "index_indoor_plants_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.integer "income"
    t.integer "prestige"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "indoor_plants", "customers"
  add_foreign_key "indoor_plants", "stores"
end
