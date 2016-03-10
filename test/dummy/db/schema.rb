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

ActiveRecord::Schema.define(version: 20160310191835) do

  create_table "vasari_collaborators", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vasari_item_collaborators", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "collaborator_id"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "vasari_item_collaborators", ["collaborator_id"], name: "index_vasari_item_collaborators_on_collaborator_id"
  add_index "vasari_item_collaborators", ["item_id"], name: "index_vasari_item_collaborators_on_item_id"
  add_index "vasari_item_collaborators", ["role_id"], name: "index_vasari_item_collaborators_on_role_id"

  create_table "vasari_items", force: :cascade do |t|
    t.string   "title"
    t.date     "date_start"
    t.date     "date_end"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "current"
    t.integer  "listable_id"
    t.string   "listable_type"
  end

  add_index "vasari_items", ["listable_type", "listable_id"], name: "index_vasari_items_on_listable_type_and_listable_id"

  create_table "vasari_life_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vasari_pictures", force: :cascade do |t|
    t.integer  "item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "vasari_pictures", ["item_id"], name: "index_vasari_pictures_on_item_id"

  create_table "vasari_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vasari_works", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end