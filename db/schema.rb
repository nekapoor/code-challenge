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

ActiveRecord::Schema.define(version: 20180514211951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "author_id"
    t.text    "comment_body"
    t.integer "rating"
    t.boolean "active",       default: true
    t.index ["author_id"], name: "index_comments_on_author_id", using: :btree
    t.index ["doctor_id"], name: "index_comments_on_doctor_id", using: :btree
  end

  create_table "doctor_specialties", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "specialty_id"
    t.index ["doctor_id"], name: "index_doctor_specialties_on_doctor_id", using: :btree
    t.index ["specialty_id"], name: "index_doctor_specialties_on_specialty_id", using: :btree
  end

  create_table "doctors", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.decimal "latitude",  precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "comments", "authors"
  add_foreign_key "comments", "doctors"
  add_foreign_key "doctor_specialties", "doctors"
  add_foreign_key "doctor_specialties", "specialties"
end
