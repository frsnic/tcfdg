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

ActiveRecord::Schema.define(version: 20160516115049) do

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
    t.integer  "user_id",        limit: 4
    t.integer  "category_id",    limit: 4
    t.datetime "posted_at"
    t.text     "content",        limit: 65535
    t.string   "title",          limit: 255
    t.string   "excerpt",        limit: 255
    t.string   "status",         limit: 255
    t.string   "comment_status", limit: 255
    t.string   "ping_status",    limit: 255
    t.string   "password",       limit: 255
    t.string   "handle",         limit: 255
    t.string   "post_type",      limit: 255
    t.string   "mime_type",      limit: 255
    t.integer  "comment_count",  limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "comments_count", limit: 4,     default: 0
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
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "whtp_hitinfo", force: :cascade do |t|
    t.string  "ip_address",           limit: 30
    t.string  "ip_status",            limit: 10, default: "active", null: false
    t.integer "ip_total_visits",      limit: 4,  default: 0
    t.string  "user_agent",           limit: 50
    t.string  "datetime_first_visit", limit: 25
    t.string  "datetime_last_visit",  limit: 25
  end

  create_table "whtp_hits", primary_key: "page_id", force: :cascade do |t|
    t.string  "page",  limit: 100,             null: false
    t.integer "count", limit: 4,   default: 0
  end

  create_table "whtp_ip2location", id: false, force: :cascade do |t|
    t.string  "ip_from",         limit: 15
    t.string  "ip_to",           limit: 15
    t.integer "decimal_ip_from", limit: 4,  null: false
    t.integer "decimal_ip_to",   limit: 4,  null: false
    t.string  "country_code",    limit: 2
    t.string  "country_name",    limit: 64
  end

  add_index "whtp_ip2location", ["ip_from", "ip_to"], name: "idx_ip_from_to", using: :btree
  add_index "whtp_ip2location", ["ip_from"], name: "idx_ip_from", using: :btree
  add_index "whtp_ip2location", ["ip_to"], name: "idx_ip_to", using: :btree

  create_table "whtp_ip_hits", force: :cascade do |t|
    t.integer  "ip_id",                limit: 4, null: false
    t.integer  "page_id",              limit: 4, null: false
    t.datetime "datetime_first_visit",           null: false
    t.datetime "datetime_last_visit",            null: false
    t.integer  "browser_id",           limit: 4, null: false
  end

  create_table "whtp_user_agents", primary_key: "agent_id", force: :cascade do |t|
    t.string "agent_name",    limit: 20,    null: false
    t.text   "agent_details", limit: 65535, null: false
  end

  add_index "whtp_user_agents", ["agent_name"], name: "agent_name", unique: true, using: :btree

  create_table "whtp_visiting_countries", id: false, force: :cascade do |t|
    t.string  "country_code", limit: 2, null: false
    t.integer "count",        limit: 4, null: false
  end

  add_index "whtp_visiting_countries", ["country_code"], name: "country_code", unique: true, using: :btree

  create_table "wp_activities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "start_at"
    t.string   "location",   limit: 255
    t.text     "link",       limit: 65535
    t.boolean  "is_public",                default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "wp_adsPage", id: false, force: :cascade do |t|
    t.integer "PageID", limit: 4,  null: false
    t.string  "IP",     limit: 17, null: false
    t.integer "Time",   limit: 4,  null: false
    t.integer "Count",  limit: 4,  null: false
  end

  create_table "wp_aiowps_events", force: :cascade do |t|
    t.string   "event_type",   limit: 150,        default: "", null: false
    t.string   "username",     limit: 150
    t.integer  "user_id",      limit: 8
    t.datetime "event_date",                                   null: false
    t.string   "ip_or_host",   limit: 100
    t.string   "referer_info", limit: 255
    t.string   "url",          limit: 255
    t.text     "event_data",   limit: 4294967295
    t.string   "country_code", limit: 50
  end

  create_table "wp_aiowps_failed_logins", force: :cascade do |t|
    t.integer  "user_id",           limit: 8,                null: false
    t.string   "user_login",        limit: 150,              null: false
    t.datetime "failed_login_date",                          null: false
    t.string   "login_attempt_ip",  limit: 100, default: "", null: false
  end

  create_table "wp_aiowps_global_meta", primary_key: "meta_id", force: :cascade do |t|
    t.datetime "date_time",                      null: false
    t.string   "meta_key1",   limit: 255,        null: false
    t.string   "meta_key2",   limit: 255,        null: false
    t.string   "meta_key3",   limit: 255,        null: false
    t.string   "meta_key4",   limit: 255,        null: false
    t.string   "meta_key5",   limit: 255,        null: false
    t.string   "meta_value1", limit: 255,        null: false
    t.text     "meta_value2", limit: 65535,      null: false
    t.text     "meta_value3", limit: 65535,      null: false
    t.text     "meta_value4", limit: 4294967295, null: false
    t.text     "meta_value5", limit: 4294967295, null: false
  end

  create_table "wp_aiowps_login_activity", force: :cascade do |t|
    t.integer  "user_id",       limit: 8,                null: false
    t.string   "user_login",    limit: 150,              null: false
    t.datetime "login_date",                             null: false
    t.datetime "logout_date",                            null: false
    t.string   "login_ip",      limit: 100, default: "", null: false
    t.string   "login_country", limit: 150, default: "", null: false
    t.string   "browser_type",  limit: 150, default: "", null: false
  end

  create_table "wp_aiowps_login_lockdown", force: :cascade do |t|
    t.integer  "user_id",         limit: 8,                null: false
    t.string   "user_login",      limit: 150,              null: false
    t.datetime "lockdown_date",                            null: false
    t.datetime "release_date",                             null: false
    t.string   "failed_login_ip", limit: 100, default: "", null: false
    t.string   "lock_reason",     limit: 128, default: "", null: false
    t.string   "unlock_key",      limit: 128, default: "", null: false
  end

  create_table "wp_aiowps_permanent_block", force: :cascade do |t|
    t.string   "blocked_ip",     limit: 100, default: "", null: false
    t.string   "block_reason",   limit: 128, default: "", null: false
    t.string   "country_origin", limit: 50,  default: "", null: false
    t.datetime "blocked_date",                            null: false
  end

  create_table "wp_commentmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "comment_id", limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_commentmeta", ["comment_id"], name: "comment_id", using: :btree
  add_index "wp_commentmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree

  create_table "wp_comments", primary_key: "comment_ID", force: :cascade do |t|
    t.integer  "comment_post_ID",      limit: 8,     default: 0,   null: false
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",        limit: 4,     default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",        limit: 255,   default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.integer  "comment_parent",       limit: 8,     default: 0,   null: false
    t.integer  "user_id",              limit: 8,     default: 0,   null: false
  end

  add_index "wp_comments", ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
  add_index "wp_comments", ["comment_author_email"], name: "comment_author_email", length: {"comment_author_email"=>10}, using: :btree
  add_index "wp_comments", ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
  add_index "wp_comments", ["comment_parent"], name: "comment_parent", using: :btree
  add_index "wp_comments", ["comment_post_ID"], name: "comment_post_ID", using: :btree

  create_table "wp_links", primary_key: "link_id", force: :cascade do |t|
    t.string   "link_url",         limit: 255,      default: "",  null: false
    t.string   "link_name",        limit: 255,      default: "",  null: false
    t.string   "link_image",       limit: 255,      default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.string   "link_description", limit: 255,      default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.integer  "link_owner",       limit: 8,        default: 1,   null: false
    t.integer  "link_rating",      limit: 4,        default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",         limit: 255,      default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",         limit: 255,      default: "",  null: false
  end

  add_index "wp_links", ["link_visible"], name: "link_visible", using: :btree

  create_table "wp_news", force: :cascade do |t|
    t.string "title",     limit: 255,  null: false
    t.string "link",      limit: 1024, null: false
    t.date   "post_time",              null: false
  end

  create_table "wp_nxs_log", id: false, force: :cascade do |t|
    t.integer  "id",      limit: 3,                  null: false
    t.datetime "date",                               null: false
    t.string   "act",     limit: 255,   default: "", null: false
    t.string   "nt",      limit: 255,   default: "", null: false
    t.string   "type",    limit: 255,   default: "", null: false
    t.text     "msg",     limit: 65535,              null: false
    t.text     "extInfo", limit: 65535,              null: false
  end

  add_index "wp_nxs_log", ["id"], name: "id", unique: true, using: :btree

  create_table "wp_options", primary_key: "option_id", force: :cascade do |t|
    t.string "option_name",  limit: 64,         default: "",    null: false
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
  end

  add_index "wp_options", ["option_name"], name: "option_name", unique: true, using: :btree

  create_table "wp_postmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "post_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_postmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wp_postmeta", ["post_id"], name: "post_id", using: :btree

  create_table "wp_posts", primary_key: "ID", force: :cascade do |t|
    t.integer  "post_author",           limit: 8,          default: 0,         null: false
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.integer  "post_parent",           limit: 8,          default: 0,         null: false
    t.string   "guid",                  limit: 255,        default: "",        null: false
    t.integer  "menu_order",            limit: 4,          default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.integer  "comment_count",         limit: 8,          default: 0,         null: false
  end

  add_index "wp_posts", ["post_author"], name: "post_author", using: :btree
  add_index "wp_posts", ["post_name"], name: "post_name", length: {"post_name"=>191}, using: :btree
  add_index "wp_posts", ["post_parent"], name: "post_parent", using: :btree
  add_index "wp_posts", ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree

  create_table "wp_schema_migrations", id: false, force: :cascade do |t|
    t.string "version", limit: 255, null: false
  end

  add_index "wp_schema_migrations", ["version"], name: "unique_schema_migrations", unique: true, using: :btree

  create_table "wp_statpress", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 3,   null: false
    t.integer  "date",         limit: 4
    t.time     "time"
    t.string   "ip",           limit: 39
    t.string   "urlrequested", limit: 250
    t.string   "agent",        limit: 250
    t.string   "referrer",     limit: 512
    t.string   "search",       limit: 250
    t.string   "nation",       limit: 2
    t.string   "os",           limit: 30
    t.string   "browser",      limit: 32
    t.string   "searchengine", limit: 16
    t.string   "spider",       limit: 32
    t.string   "feed",         limit: 8
    t.string   "user",         limit: 16
    t.datetime "timestamp",                null: false
  end

  add_index "wp_statpress", ["agent"], name: "agent", using: :btree
  add_index "wp_statpress", ["browser"], name: "browser", using: :btree
  add_index "wp_statpress", ["date", "feed", "spider"], name: "date_feed_spider", using: :btree
  add_index "wp_statpress", ["feed", "spider", "browser"], name: "feed_spider_browser", using: :btree
  add_index "wp_statpress", ["feed", "spider", "os"], name: "feed_spider_os", using: :btree
  add_index "wp_statpress", ["id"], name: "id", unique: true, using: :btree
  add_index "wp_statpress", ["ip", "date"], name: "ip_date", using: :btree
  add_index "wp_statpress", ["os"], name: "os", using: :btree
  add_index "wp_statpress", ["referrer"], name: "referrer", length: {"referrer"=>255}, using: :btree
  add_index "wp_statpress", ["search"], name: "search", using: :btree
  add_index "wp_statpress", ["spider", "nation"], name: "spider_nation", using: :btree

  create_table "wp_tabulate_changes", force: :cascade do |t|
    t.integer "changeset_id", limit: 4,                            null: false
    t.string  "change_type",  limit: 11,         default: "field", null: false
    t.text    "table_name",   limit: 255,                          null: false
    t.text    "record_ident", limit: 255,                          null: false
    t.text    "column_name",  limit: 255,                          null: false
    t.text    "old_value",    limit: 4294967295
    t.text    "new_value",    limit: 4294967295
  end

  add_index "wp_tabulate_changes", ["changeset_id"], name: "changeset_id", using: :btree

  create_table "wp_tabulate_changesets", force: :cascade do |t|
    t.datetime "date_and_time",               null: false
    t.integer  "user_id",       limit: 8,     null: false
    t.text     "comment",       limit: 65535
  end

  add_index "wp_tabulate_changesets", ["user_id"], name: "user_id", using: :btree

  create_table "wp_term_relationships", id: false, force: :cascade do |t|
    t.integer "object_id",        limit: 8, default: 0, null: false
    t.integer "term_taxonomy_id", limit: 8, default: 0, null: false
    t.integer "term_order",       limit: 4, default: 0, null: false
  end

  add_index "wp_term_relationships", ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree

  create_table "wp_term_taxonomy", primary_key: "term_taxonomy_id", force: :cascade do |t|
    t.integer "term_id",     limit: 8,          default: 0,  null: false
    t.string  "taxonomy",    limit: 32,         default: "", null: false
    t.text    "description", limit: 4294967295,              null: false
    t.integer "parent",      limit: 8,          default: 0,  null: false
    t.integer "count",       limit: 8,          default: 0,  null: false
  end

  add_index "wp_term_taxonomy", ["taxonomy"], name: "taxonomy", using: :btree
  add_index "wp_term_taxonomy", ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree

  create_table "wp_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group", limit: 8,   default: 0,  null: false
  end

  add_index "wp_terms", ["name"], name: "name", length: {"name"=>191}, using: :btree
  add_index "wp_terms", ["slug"], name: "slug", length: {"slug"=>191}, using: :btree

  create_table "wp_usermeta", primary_key: "umeta_id", force: :cascade do |t|
    t.integer "user_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_usermeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wp_usermeta", ["user_id"], name: "user_id", using: :btree

  create_table "wp_users", primary_key: "ID", force: :cascade do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",           limit: 64,  default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key", limit: 60,  default: "", null: false
    t.integer  "user_status",         limit: 4,   default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
  end

  add_index "wp_users", ["user_login"], name: "user_login_key", using: :btree
  add_index "wp_users", ["user_nicename"], name: "user_nicename", using: :btree

  create_table "wpb2d_excluded_files", id: false, force: :cascade do |t|
    t.string  "file",  limit: 255, null: false
    t.boolean "isdir",             null: false
  end

  add_index "wpb2d_excluded_files", ["file"], name: "file", unique: true, using: :btree

  create_table "wpb2d_options", id: false, force: :cascade do |t|
    t.string "name",  limit: 50,  null: false
    t.string "value", limit: 255, null: false
  end

  add_index "wpb2d_options", ["name"], name: "name", unique: true, using: :btree

  create_table "wpb2d_processed_dbtables", id: false, force: :cascade do |t|
    t.string  "name",  limit: 255,             null: false
    t.integer "count", limit: 4,   default: 0, null: false
  end

  add_index "wpb2d_processed_dbtables", ["name"], name: "name", unique: true, using: :btree

  create_table "wpb2d_processed_files", id: false, force: :cascade do |t|
    t.string  "file",     limit: 255,             null: false
    t.integer "offset",   limit: 4,   default: 0, null: false
    t.string  "uploadid", limit: 50
  end

  add_index "wpb2d_processed_files", ["file"], name: "file", unique: true, using: :btree

  create_table "wpf_jqgrid_sample", primary_key: "ID", force: :cascade do |t|
    t.string   "City",     limit: 100
    t.decimal  "Temp_C",               precision: 10, scale: 2
    t.datetime "Date"
    t.integer  "High",     limit: 4,                            null: false
    t.integer  "Verified", limit: 4
  end

  add_foreign_key "wp_tabulate_changes", "wp_tabulate_changesets", column: "changeset_id", name: "wp_tabulate_changes_ibfk_1"
  add_foreign_key "wp_tabulate_changesets", "wp_users", column: "user_id", primary_key: "ID", name: "wp_tabulate_changesets_ibfk_1"
end
