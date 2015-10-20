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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151019083115) do

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "link_name"
    t.boolean "published", :default => true
    t.string  "slug"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "published",            :default => true
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "slug"
  end

  add_index "folders", ["slug"], :name => "index_folders_on_slug"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pictures", :force => true do |t|
    t.integer  "slider_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "model"
    t.text     "description"
    t.boolean  "published",            :default => true
    t.string   "slug"
    t.integer  "folder_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "products", ["slug", "id", "folder_id"], :name => "index_products_on_slug_and_id_and_folder_id"

  create_table "sliders", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
