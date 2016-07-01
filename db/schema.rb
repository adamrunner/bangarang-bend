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


ActiveRecord::Schema.define(version: 20160630224635) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "biography_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "img_url",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image",       limit: 255
  end

  add_index "biography_items", ["page_id"], name: "index_biography_items_on_page_id", using: :btree

  create_table "catering_menus", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "catering_menus", ["page_id"], name: "index_catering_menus_on_page_id", using: :btree

  create_table "event_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "event_items", ["page_id"], name: "index_event_items_on_page_id", using: :btree

  create_table "event_items_produce_items", id: false, force: :cascade do |t|
    t.integer "event_item_id",         limit: 4
    t.integer "event_produce_item_id", limit: 4
  end

  add_index "event_items_produce_items", ["event_item_id"], name: "index_event_items_produce_items_on_event_item_id", using: :btree
  add_index "event_items_produce_items", ["event_produce_item_id"], name: "index_event_items_produce_items_on_event_produce_item_id", using: :btree

  create_table "event_produce_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "event_produce_items", ["page_id"], name: "index_event_produce_items_on_page_id", using: :btree

  create_table "featured_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "image_url",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image",       limit: 255
    t.string   "link_url",    limit: 255
  end

  add_index "featured_items", ["page_id"], name: "index_featured_items_on_page_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "url",            limit: 255
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "avatar",         limit: 255
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "landings", force: :cascade do |t|
    t.integer  "page_id",    limit: 4
    t.string   "heading",    limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "landings", ["page_id"], name: "index_landings_on_page_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.integer  "menu_section_id", limit: 4
    t.string   "name",            limit: 255
    t.text     "choices",         limit: 65535
    t.string   "price",           limit: 255
    t.string   "special_attr",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "menu_items", ["menu_section_id"], name: "index_menu_items_on_menu_section_id", using: :btree

  create_table "menu_sections", force: :cascade do |t|
    t.integer  "catering_menu_id", limit: 4
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "menu_sections", ["catering_menu_id"], name: "index_menu_sections_on_catering_menu_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "link_name",      limit: 255
    t.text     "description",    limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "copy_text",      limit: 65535
    t.boolean  "show_copy_text",               default: false
  end

  create_table "philosophy_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "philosophy_items", ["page_id"], name: "index_philosophy_items_on_page_id", using: :btree

  create_table "service_items", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "service_items", ["page_id"], name: "index_service_items_on_page_id", using: :btree

end
