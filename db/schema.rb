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

ActiveRecord::Schema.define(version: 2021_04_17_092639) do

  create_table "activities", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "start_at"
    t.string "location"
    t.text "link"
    t.boolean "is_public", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "handle"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "category_posts", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
    t.index ["category_id", "post_id"], name: "index_category_posts_on_category_id_and_post_id"
    t.index ["category_id"], name: "index_category_posts_on_category_id"
    t.index ["post_id"], name: "index_category_posts_on_post_id"
  end

  create_table "ckeditor_assets", charset: "utf8", force: :cascade do |t|
    t.string "data_uid", null: false
    t.string "data_name", null: false
    t.string "data_mime_type"
    t.integer "data_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "name"
    t.string "email"
    t.string "url"
    t.string "ip"
    t.text "content"
    t.boolean "approved"
    t.string "agent"
    t.string "comment_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_images_on_post_id"
  end

  create_table "news", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "link", limit: 1024, null: false
    t.datetime "posted_at"
  end

  create_table "post_meta", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "keywords"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_meta_on_post_id"
  end

  create_table "post_tags", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.index ["post_id", "tag_id"], name: "index_post_tags_on_post_id_and_tag_id"
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "posted_at"
    t.text "content"
    t.string "title"
    t.string "excerpt"
    t.string "status"
    t.string "comment_status"
    t.string "ping_status"
    t.string "password"
    t.string "handle"
    t.string "mime_type"
    t.integer "comment_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.integer "main_picture_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "previews", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "posted_at"
    t.string "title"
    t.text "content"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_previews_on_user_id"
  end

  create_table "tags", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
  end

  create_table "tcdfg_wp_adsPage", primary_key: ["PageID", "IP"], charset: "utf8", force: :cascade do |t|
    t.integer "PageID", null: false
    t.string "IP", limit: 17, null: false
    t.integer "Time", null: false
    t.integer "Count", null: false
  end

  create_table "tcdfg_wp_aiowps_events", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "event_type", limit: 150, default: "", null: false
    t.string "username", limit: 150
    t.bigint "user_id"
    t.datetime "event_date", null: false
    t.string "ip_or_host", limit: 100
    t.string "referer_info"
    t.string "url"
    t.text "event_data", size: :long
    t.string "country_code", limit: 50
  end

  create_table "tcdfg_wp_aiowps_failed_logins", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_login", limit: 150, null: false
    t.datetime "failed_login_date", null: false
    t.string "login_attempt_ip", limit: 100, default: "", null: false
  end

  create_table "tcdfg_wp_aiowps_global_meta", primary_key: "meta_id", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.datetime "date_time", null: false
    t.string "meta_key1", null: false
    t.string "meta_key2", null: false
    t.string "meta_key3", null: false
    t.string "meta_key4", null: false
    t.string "meta_key5", null: false
    t.string "meta_value1", null: false
    t.text "meta_value2", null: false
    t.text "meta_value3", null: false
    t.text "meta_value4", size: :long, null: false
    t.text "meta_value5", size: :long, null: false
  end

  create_table "tcdfg_wp_aiowps_login_activity", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_login", limit: 150, null: false
    t.datetime "login_date", null: false
    t.datetime "logout_date", null: false
    t.string "login_ip", limit: 100, default: "", null: false
    t.string "login_country", limit: 150, default: "", null: false
    t.string "browser_type", limit: 150, default: "", null: false
  end

  create_table "tcdfg_wp_aiowps_login_lockdown", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_login", limit: 150, null: false
    t.datetime "lockdown_date", null: false
    t.datetime "release_date", null: false
    t.string "failed_login_ip", limit: 100, default: "", null: false
    t.string "lock_reason", limit: 128, default: "", null: false
    t.string "unlock_key", limit: 128, default: "", null: false
  end

  create_table "tcdfg_wp_aiowps_permanent_block", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "blocked_ip", limit: 100, default: "", null: false
    t.string "block_reason", limit: 128, default: "", null: false
    t.string "country_origin", limit: 50, default: "", null: false
    t.datetime "blocked_date", null: false
  end

  create_table "tcdfg_wp_commentmeta", primary_key: "meta_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "comment_id", default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text "meta_value", size: :long
    t.index ["comment_id"], name: "comment_id"
    t.index ["meta_key"], name: "meta_key", length: 191
  end

  create_table "tcdfg_wp_comments", primary_key: "comment_ID", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "comment_post_ID", default: 0, null: false, unsigned: true
    t.text "comment_author", size: :tiny, null: false
    t.string "comment_author_email", limit: 100, default: "", null: false
    t.string "comment_author_url", limit: 200, default: "", null: false
    t.string "comment_author_IP", limit: 100, default: "", null: false
    t.datetime "comment_date", null: false
    t.datetime "comment_date_gmt", null: false
    t.text "comment_content", null: false
    t.integer "comment_karma", default: 0, null: false
    t.string "comment_approved", limit: 20, default: "1", null: false
    t.string "comment_agent", default: "", null: false
    t.string "comment_type", limit: 20, default: "", null: false
    t.bigint "comment_parent", default: 0, null: false, unsigned: true
    t.bigint "user_id", default: 0, null: false, unsigned: true
    t.index ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt"
    t.index ["comment_author_email"], name: "comment_author_email", length: 10
    t.index ["comment_date_gmt"], name: "comment_date_gmt"
    t.index ["comment_parent"], name: "comment_parent"
    t.index ["comment_post_ID"], name: "comment_post_ID"
  end

  create_table "tcdfg_wp_links", primary_key: "link_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "link_url", default: "", null: false
    t.string "link_name", default: "", null: false
    t.string "link_image", default: "", null: false
    t.string "link_target", limit: 25, default: "", null: false
    t.string "link_description", default: "", null: false
    t.string "link_visible", limit: 20, default: "Y", null: false
    t.bigint "link_owner", default: 1, null: false, unsigned: true
    t.integer "link_rating", default: 0, null: false
    t.datetime "link_updated", null: false
    t.string "link_rel", default: "", null: false
    t.text "link_notes", size: :medium, null: false
    t.string "link_rss", default: "", null: false
    t.index ["link_visible"], name: "link_visible"
  end

  create_table "tcdfg_wp_nxs_log", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "id", limit: 3, null: false, auto_increment: true
    t.datetime "date", null: false
    t.string "act", default: "", null: false
    t.string "nt", default: "", null: false
    t.string "type", default: "", null: false
    t.text "msg", null: false
    t.text "extInfo", null: false
    t.index ["id"], name: "id", unique: true
  end

  create_table "tcdfg_wp_options", primary_key: "option_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "option_name", limit: 64, default: "", null: false
    t.text "option_value", size: :long, null: false
    t.string "autoload", limit: 20, default: "yes", null: false
    t.index ["option_name"], name: "option_name", unique: true
  end

  create_table "tcdfg_wp_postmeta", primary_key: "meta_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "post_id", default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text "meta_value", size: :long
    t.index ["meta_key"], name: "meta_key", length: 191
    t.index ["post_id"], name: "post_id"
  end

  create_table "tcdfg_wp_posts", primary_key: "ID", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "post_author", default: 0, null: false, unsigned: true
    t.datetime "post_date", null: false
    t.datetime "post_date_gmt", null: false
    t.text "post_content", size: :long, null: false
    t.text "post_title", null: false
    t.text "post_excerpt", null: false
    t.string "post_status", limit: 20, default: "publish", null: false
    t.string "comment_status", limit: 20, default: "open", null: false
    t.string "ping_status", limit: 20, default: "open", null: false
    t.string "post_password", limit: 20, default: "", null: false
    t.string "post_name", limit: 200, default: "", null: false
    t.text "to_ping", null: false
    t.text "pinged", null: false
    t.datetime "post_modified", null: false
    t.datetime "post_modified_gmt", null: false
    t.text "post_content_filtered", size: :long, null: false
    t.bigint "post_parent", default: 0, null: false, unsigned: true
    t.string "guid", default: "", null: false
    t.integer "menu_order", default: 0, null: false
    t.string "post_type", limit: 20, default: "post", null: false
    t.string "post_mime_type", limit: 100, default: "", null: false
    t.bigint "comment_count", default: 0, null: false
    t.index ["post_author"], name: "post_author"
    t.index ["post_name"], name: "post_name", length: 191
    t.index ["post_parent"], name: "post_parent"
    t.index ["post_type", "post_status", "post_date", "ID"], name: "type_status_date"
  end

  create_table "tcdfg_wp_statpress", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "id", limit: 3, null: false, auto_increment: true
    t.integer "date"
    t.time "time"
    t.string "ip", limit: 39
    t.string "urlrequested", limit: 250
    t.string "agent", limit: 250
    t.string "referrer", limit: 512
    t.string "search", limit: 250
    t.string "nation", limit: 2
    t.string "os", limit: 30
    t.string "browser", limit: 32
    t.string "searchengine", limit: 16
    t.string "spider", limit: 32
    t.string "feed", limit: 8
    t.string "user", limit: 16
    t.timestamp "timestamp", null: false
    t.index ["agent"], name: "agent"
    t.index ["browser"], name: "browser"
    t.index ["date", "feed", "spider"], name: "date_feed_spider"
    t.index ["feed", "spider", "browser"], name: "feed_spider_browser"
    t.index ["feed", "spider", "os"], name: "feed_spider_os"
    t.index ["id"], name: "id", unique: true
    t.index ["ip", "date"], name: "ip_date"
    t.index ["os"], name: "os"
    t.index ["referrer"], name: "referrer", length: 255
    t.index ["search"], name: "search"
    t.index ["spider", "nation"], name: "spider_nation"
  end

  create_table "tcdfg_wp_tabulate_changes", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "changeset_id", null: false, unsigned: true
    t.column "change_type", "enum('field','file','foreign_key')", default: "field", null: false
    t.text "table_name", size: :tiny, null: false
    t.text "record_ident", size: :tiny, null: false
    t.text "column_name", size: :tiny, null: false
    t.text "old_value", size: :long
    t.text "new_value", size: :long
    t.index ["changeset_id"], name: "changeset_id"
  end

  create_table "tcdfg_wp_tabulate_changesets", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.datetime "date_and_time", null: false
    t.bigint "user_id", null: false, unsigned: true
    t.text "comment"
    t.index ["user_id"], name: "user_id"
  end

  create_table "tcdfg_wp_term_relationships", primary_key: ["object_id", "term_taxonomy_id"], charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "object_id", default: 0, null: false, unsigned: true
    t.bigint "term_taxonomy_id", default: 0, null: false, unsigned: true
    t.integer "term_order", default: 0, null: false
    t.index ["term_taxonomy_id"], name: "term_taxonomy_id"
  end

  create_table "tcdfg_wp_term_taxonomy", primary_key: "term_taxonomy_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "term_id", default: 0, null: false, unsigned: true
    t.string "taxonomy", limit: 32, default: "", null: false
    t.text "description", size: :long, null: false
    t.bigint "parent", default: 0, null: false, unsigned: true
    t.bigint "count", default: 0, null: false
    t.index ["taxonomy"], name: "taxonomy"
    t.index ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true
  end

  create_table "tcdfg_wp_terms", primary_key: "term_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 200, default: "", null: false
    t.string "slug", limit: 200, default: "", null: false
    t.bigint "term_group", default: 0, null: false
    t.index ["name"], name: "name", length: 191
    t.index ["slug"], name: "slug", length: 191
  end

  create_table "tcdfg_wp_usermeta", primary_key: "umeta_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text "meta_value", size: :long
    t.index ["meta_key"], name: "meta_key", length: 191
    t.index ["user_id"], name: "user_id"
  end

  create_table "tcdfg_wp_users", primary_key: "ID", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "user_login", limit: 60, default: "", null: false
    t.string "user_pass", limit: 64, default: "", null: false
    t.string "user_nicename", limit: 50, default: "", null: false
    t.string "user_email", limit: 100, default: "", null: false
    t.string "user_url", limit: 100, default: "", null: false
    t.datetime "user_registered", null: false
    t.string "user_activation_key", limit: 60, default: "", null: false
    t.integer "user_status", default: 0, null: false
    t.string "display_name", limit: 250, default: "", null: false
    t.index ["user_login"], name: "user_login_key"
    t.index ["user_nicename"], name: "user_nicename"
  end

  create_table "tcdfg_wp_wpb2d_excluded_files", id: false, charset: "utf8", force: :cascade do |t|
    t.string "file", null: false
    t.boolean "isdir", null: false
    t.index ["file"], name: "file", unique: true
  end

  create_table "tcdfg_wp_wpb2d_options", id: false, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "value", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "tcdfg_wp_wpb2d_processed_dbtables", id: false, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "count", default: 0, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "tcdfg_wp_wpb2d_processed_files", id: false, charset: "utf8", force: :cascade do |t|
    t.string "file", null: false
    t.integer "offset", default: 0, null: false
    t.string "uploadid", limit: 50
    t.index ["file"], name: "file", unique: true
  end

  create_table "users", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 2
    t.string "identify"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "whtp_hitinfo", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "ip_address", limit: 30
    t.string "ip_status", limit: 10, default: "active", null: false
    t.integer "ip_total_visits", default: 0
    t.string "user_agent", limit: 50
    t.string "datetime_first_visit", limit: 25
    t.string "datetime_last_visit", limit: 25
  end

  create_table "whtp_hits", primary_key: "page_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "page", limit: 100, null: false
    t.integer "count", default: 0
  end

  create_table "whtp_ip2location", id: false, charset: "utf8", collation: "utf8_bin", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "ip_from", limit: 15
    t.string "ip_to", limit: 15
    t.integer "decimal_ip_from", null: false
    t.integer "decimal_ip_to", null: false
    t.string "country_code", limit: 2
    t.string "country_name", limit: 64
    t.index ["ip_from", "ip_to"], name: "idx_ip_from_to"
    t.index ["ip_from"], name: "idx_ip_from"
    t.index ["ip_to"], name: "idx_ip_to"
  end

  create_table "whtp_ip_hits", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "ip_id", null: false
    t.integer "page_id", null: false
    t.datetime "datetime_first_visit", null: false
    t.datetime "datetime_last_visit", null: false
    t.integer "browser_id", null: false
  end

  create_table "whtp_user_agents", primary_key: "agent_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "agent_name", limit: 20, null: false
    t.text "agent_details", null: false
    t.index ["agent_name"], name: "agent_name", unique: true
  end

  create_table "whtp_visiting_countries", id: false, charset: "utf8", force: :cascade do |t|
    t.string "country_code", limit: 2, null: false
    t.integer "count", null: false
    t.index ["country_code"], name: "country_code", unique: true
  end

  create_table "wpf_jqgrid_sample", primary_key: "ID", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "City", limit: 100
    t.decimal "Temp_C", precision: 10, scale: 2
    t.datetime "Date"
    t.integer "High", null: false
    t.integer "Verified"
  end

  add_foreign_key "tcdfg_wp_tabulate_changes", "tcdfg_wp_tabulate_changesets", column: "changeset_id", name: "tcdfg_wp_tabulate_changes_ibfk_1"
  add_foreign_key "tcdfg_wp_tabulate_changesets", "tcdfg_wp_users", column: "user_id", primary_key: "ID", name: "tcdfg_wp_tabulate_changesets_ibfk_1"
end
