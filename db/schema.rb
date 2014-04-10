# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140410145749) do

  create_table "file_uploads", force: true do |t|
    t.integer  "partner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "partner_id"
    t.string   "chassis_no"
    t.string   "size"
    t.string   "container_no"
    t.string   "booking_no"
    t.string   "customer"
    t.string   "pull_out_date"
    t.string   "pull_out_time_out"
    t.string   "pull_out_tracker"
    t.string   "pull_out_plate_no"
    t.string   "return_eir_no"
    t.string   "return_date"
    t.string   "return_time_in"
    t.string   "return_tracker"
    t.string   "return_plate_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "leasing_company"
    t.string   "year"
    t.string   "month"
    t.string   "service_type"
    t.string   "bound"
    t.string   "trade"
    t.string   "vessel_destination"
    t.string   "authorized_no"
    t.string   "free_time"
    t.string   "trucker_container_pick_up"
    t.date     "trucker_container_pick_up_date"
    t.string   "container_return_delivery"
    t.string   "container_return_plate_no"
    t.string   "container_return_date"
    t.string   "return_recieved_by"
    t.string   "return_chassis_no"
    t.string   "return_container_no"
    t.string   "return_shipper"
    t.date     "return_date_out"
    t.string   "return_booking_no"
  end

  create_table "partners", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
