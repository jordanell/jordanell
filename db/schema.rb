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

ActiveRecord::Schema.define(version: 20151203043259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",                                   null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                default: false
    t.boolean  "visible",                 default: false
    t.string   "slug",                                    null: false
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
  end

  add_index "posts", ["featured"], name: "index_posts_on_featured", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["visible"], name: "index_posts_on_visible", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                default: false
    t.boolean  "visible",                 default: false
    t.string   "slug",                                    null: false
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
  end

  add_index "projects", ["featured"], name: "index_projects_on_featured", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  add_index "projects", ["visible"], name: "index_projects_on_visible", using: :btree

end
