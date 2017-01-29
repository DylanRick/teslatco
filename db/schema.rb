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

ActiveRecord::Schema.define(version: 20170129154029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incentives", force: :cascade do |t|
    t.string   "state"
    t.string   "state_code"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "makes", force: :cascade do |t|
    t.integer  "edmund_id"
    t.string   "name"
    t.string   "nice_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "edmund_id"
    t.string   "name"
    t.string   "submodel"
    t.string   "nice_submodel"
    t.string   "model"
    t.string   "nice_model"
    t.string   "years"
    t.integer  "make_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "models", ["make_id"], name: "index_models_on_make_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "edmund_id"
    t.string   "price"
    t.string   "trim"
    t.string   "style_long_name"
    t.integer  "model_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "styles", ["model_id"], name: "index_styles_on_model_id", using: :btree

  create_table "teslas", force: :cascade do |t|
    t.string   "model"
    t.string   "trim"
    t.decimal  "price",          precision: 8, scale: 2
    t.decimal  "insurance",      precision: 8, scale: 2, default: 0.0
    t.decimal  "maintenance",    precision: 8, scale: 2, default: 0.0
    t.decimal  "taxes_and_fees", precision: 8, scale: 2, default: 0.0
    t.decimal  "financing",      precision: 8, scale: 2, default: 0.0
    t.decimal  "depreciation",   precision: 8, scale: 2, default: 0.0
    t.decimal  "fuel",           precision: 8, scale: 2, default: 0.0
    t.decimal  "tax_credit",     precision: 8, scale: 2, default: 0.0
    t.decimal  "total",          precision: 8, scale: 2
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_foreign_key "models", "makes"
  add_foreign_key "styles", "models"
end
