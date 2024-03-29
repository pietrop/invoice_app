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

ActiveRecord::Schema.define(version: 20130820113215) do

  create_table "bank_details", force: true do |t|
    t.string   "sort_code"
    t.integer  "account_number"
    t.string   "account_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "my_detail_id"
  end

  add_index "bank_details", ["my_detail_id"], name: "index_bank_details_on_my_detail_id"

  create_table "clients", force: true do |t|
    t.string   "client_name"
    t.string   "client_address"
    t.string   "contact_name"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_details", force: true do |t|
    t.integer  "number"
    t.date     "date"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_details", ["invoice_id"], name: "index_form_details_on_invoice_id"

  create_table "invoices", force: true do |t|
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "my_detail_id"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"
  add_index "invoices", ["my_detail_id"], name: "index_invoices_on_my_detail_id"

  create_table "my_details", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.date     "date"
    t.string   "service"
    t.integer  "rate"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["invoice_id"], name: "index_services_on_invoice_id"

end
