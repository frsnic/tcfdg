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

ActiveRecord::Schema.define(version: 20160524030413) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.string   "link",       limit: 255
    t.boolean  "is_public"
    t.datetime "start_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "handle",      limit: 255
    t.integer  "parent_id",   limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "posts_count", limit: 4,   default: 0
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "category_posts", force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "post_id",     limit: 4
  end

  add_index "category_posts", ["category_id", "post_id"], name: "index_category_posts_on_category_id_and_post_id", using: :btree
  add_index "category_posts", ["category_id"], name: "index_category_posts_on_category_id", using: :btree
  add_index "category_posts", ["post_id"], name: "index_category_posts_on_post_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_uid",       limit: 255, null: false
    t.string   "data_name",      limit: 255, null: false
    t.string   "data_mime_type", limit: 255
    t.integer  "data_size",      limit: 4
    t.integer  "assetable_id",   limit: 4
    t.string   "assetable_type", limit: 30
    t.string   "type",           limit: 30
    t.integer  "data_width",     limit: 4
    t.integer  "data_height",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.string   "url",          limit: 255
    t.string   "ip",           limit: 255
    t.text     "content",      limit: 65535
    t.boolean  "approved"
    t.string   "agent",        limit: 255
    t.string   "comment_type", limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "picture_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "images", ["post_id"], name: "index_images_on_post_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "link",       limit: 255
    t.datetime "posted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "post_meta", force: :cascade do |t|
    t.integer  "post_id",     limit: 4
    t.string   "keywords",    limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "post_meta", ["post_id"], name: "index_post_meta_on_post_id", using: :btree

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id", limit: 4
    t.integer "tag_id",  limit: 4
  end

  add_index "post_tags", ["post_id", "tag_id"], name: "index_post_tags_on_post_id_and_tag_id", using: :btree
  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id", using: :btree
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "category_id",     limit: 4
    t.datetime "posted_at"
    t.text     "content",         limit: 65535
    t.string   "title",           limit: 255
    t.string   "excerpt",         limit: 255
    t.string   "status",          limit: 255
    t.string   "comment_status",  limit: 255
    t.string   "ping_status",     limit: 255
    t.string   "password",        limit: 255
    t.string   "handle",          limit: 255
    t.string   "mime_type",       limit: 255
    t.integer  "comment_count",   limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "comments_count",  limit: 4,     default: 0
    t.integer  "main_picture_id", limit: 4
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "previews", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "posted_at"
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "token",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "previews", ["user_id"], name: "index_previews_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "posts_count", limit: 4,   default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4,   default: 2
    t.string   "identify",               limit: 255
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
    t.integer  "posts_count",            limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
