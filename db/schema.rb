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

ActiveRecord::Schema.define(version: 20161121091708) do

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
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
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

  create_table "referral_back_slips", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "received_facility_name"
    t.string   "received_doctors_number"
    t.string   "doctor_replying_names"
    t.string   "doctors_speciality"
    t.string   "replying_date"
    t.string   "initiated_facility_name"
    t.string   "initiated_facility_address"
    t.integer  "patient_identity_number"
    t.integer  "patient_age"
    t.string   "patient_gender"
    t.string   "patient_address"
    t.string   "patient_was_seen_by"
    t.string   "when_patient_was_seen"
    t.text     "special_investigation"
    t.text     "special_findings"
    t.text     "diagnosis"
    t.text     "treatments"
    t.string   "operation"
    t.text     "medications_prescribed"
    t.string   "please_continue_with"
    t.string   "refer_back_to"
    t.string   "on_date"
    t.text     "referral_back_slip_message"
    t.string   "patient_full_names"
  end

  create_table "referral_forms", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "type_of_referral"
    t.string   "initiating_facility_name"
    t.string   "date_of_referral"
    t.string   "referring_doctors_name"
    t.string   "referring_doctors_speciality"
    t.string   "patient_full_names"
    t.integer  "patient_identity_number"
    t.integer  "patient_age"
    t.string   "patient_gender"
    t.string   "patient_address"
    t.string   "patient_mobile_number"
    t.text     "patient_clinical_history"
    t.text     "findings"
    t.text     "treatment_given"
    t.text     "reasons_for_referral"
    t.string   "referred_facility_name"
    t.string   "address_of_referred_facility"
    t.string   "referred_facility_doctors_name"
    t.string   "referring_doctors_mobile_number"
    t.text     "optional_message"
    t.string   "initiating_facility_address"
    t.string   "referral_status"
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
