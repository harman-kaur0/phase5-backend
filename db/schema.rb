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

ActiveRecord::Schema.define(version: 2021_06_30_230355) do

  create_table "appointments", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "employee_id", null: false
    t.datetime "startDate"
    t.datetime "endDate"
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_appointments_on_employee_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.string "group_number"
    t.string "name"
    t.string "subscriber_name"
    t.string "subscriber_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_insurances_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "address"
    t.string "date_of_birth"
    t.string "email"
    t.string "ethnicity"
    t.string "language"
    t.string "name"
    t.string "password_digest"
    t.string "phone_number"
    t.string "race"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "employee_id", null: false
    t.string "name"
    t.string "directions"
    t.string "quantity"
    t.boolean "approved", default: false
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_prescriptions_on_employee_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  add_foreign_key "appointments", "employees"
  add_foreign_key "appointments", "patients"
  add_foreign_key "insurances", "patients"
  add_foreign_key "prescriptions", "employees"
  add_foreign_key "prescriptions", "patients"
end
