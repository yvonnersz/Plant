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

ActiveRecord::Schema.define(version: 2020_07_16_031119) do

  create_table "indoor_plants", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "image"
    t.integer "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_indoor_plants_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.integer "income"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "user_indoor_plants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "indoor_plant_id", null: false
    t.index ["indoor_plant_id"], name: "index_user_indoor_plants_on_indoor_plant_id"
    t.index ["user_id"], name: "index_user_indoor_plants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "name"
    t.integer "cash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "indoor_plants", "stores"
  add_foreign_key "stores", "users"
  add_foreign_key "user_indoor_plants", "indoor_plants"
  add_foreign_key "user_indoor_plants", "users"
end
