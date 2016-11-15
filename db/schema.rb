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

ActiveRecord::Schema.define(version: 20161111113553) do

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "email"
    t.integer  "hospital_id"
    t.string   "surname"
    t.string   "country"
    t.string   "region"
    t.string   "mobile_number"
    t.string   "city"
    t.string   "gender"
    t.string   "education"
    t.text     "educational_summary"
    t.string   "mobile_number2"
    t.string   "speciality"
    t.integer  "id_card_number"
    t.string   "given_names"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "hospital_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "hospital_city"
  end

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "remember_digest"
    t.integer  "hospital_id"
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["hospital_id"], name: "index_managers_on_hospital_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "patientID"
    t.string   "patient_full_names"
    t.string   "patient_contact"
    t.string   "referral_type"
    t.text     "reasons_for_referrals"
    t.string   "referred_doctor"
    t.string   "referred_hospital_name"
    t.string   "signature"
    t.string   "doctors_name"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "hospital_id"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["hospital_id"], name: "index_staffs_on_hospital_id"
  end

end
