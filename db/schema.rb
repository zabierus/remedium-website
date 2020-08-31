# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_152057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer "track_id", null: false
    t.string "title"
    t.string "cover"
    t.datetime "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_translations", force: :cascade do |t|
    t.integer "article_id", null: false
    t.string "locale", null: false
    t.boolean "in_site_map"
    t.string "name"
    t.text "body"
    t.text "meta_tags"
    t.string "meta_title"
    t.text "meta_description"
    t.string "slug"
    t.index ["article_id", "locale", "slug"], name: "index_article_translations_on_article_id_and_locale_and_slug"
  end

  create_table "articles", force: :cascade do |t|
    t.string "code"
    t.string "author"
    t.boolean "news"
    t.boolean "archived"
    t.oid "image"
    t.boolean "for_logged"
    t.boolean "visible", default: true
    t.datetime "visible_from"
    t.datetime "visible_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "banner_item_translations", force: :cascade do |t|
    t.integer "banner_item_id", null: false
    t.string "locale", null: false
    t.boolean "in_site_map"
    t.string "name"
    t.string "title"
    t.text "description"
    t.string "button_name"
    t.index ["banner_item_id", "locale"], name: "index_banner_item_translations_on_banner_item_id_and_locale"
  end

  create_table "banner_items", force: :cascade do |t|
    t.integer "banner_id", null: false
    t.oid "file"
    t.string "url"
    t.string "url_target"
    t.integer "clicks_count"
    t.integer "position"
    t.boolean "for_logged"
    t.boolean "visible", default: true
    t.datetime "visible_from"
    t.datetime "visible_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string "code"
    t.integer "banner_items_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_articles", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "article_id", null: false
    t.index ["category_id", "article_id"], name: "index_categories_articles_on_category_id_and_article_id"
  end

  create_table "categories_media_files", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "media_file_id", null: false
    t.index ["category_id", "media_file_id"], name: "index_categories_media_files_on_category_id_and_media_file_id"
  end

  create_table "categories_uploads", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "upload_id", null: false
    t.index ["category_id", "upload_id"], name: "index_categories_uploads_on_category_id_and_upload_id"
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "locale", null: false
    t.string "name"
    t.string "slug"
    t.index ["category_id", "locale", "slug"], name: "index_category_translations_on_category_id_and_locale_and_slug"
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_template_keywords", id: false, force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "email_template_id"
  end

  create_table "email_template_translations", force: :cascade do |t|
    t.integer "template_id", null: false
    t.string "locale", null: false
    t.string "title"
    t.text "body"
    t.string "cc_list"
    t.string "bcc_list"
    t.index ["template_id", "locale"], name: "index_email_template_translations_on_template_id_and_locale"
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "code", null: false
    t.boolean "send"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.string "color_rgb"
    t.string "font_color_rgb"
    t.boolean "default"
    t.string "code"
  end

  create_table "events", force: :cascade do |t|
    t.integer "event_type_id"
    t.integer "user_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "title"
    t.string "venue"
    t.string "location"
    t.text "desc"
    t.text "link"
    t.string "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "form_translations", force: :cascade do |t|
    t.integer "form_id", null: false
    t.string "name"
    t.text "body"
    t.string "slug"
    t.string "locale", null: false
    t.index ["form_id", "locale", "slug"], name: "idx_form_translations_form_id_locale_slug"
  end

  create_table "forms", force: :cascade do |t|
    t.integer "article_id"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.boolean "categorization"
    t.string "code", null: false
    t.boolean "for_logged"
    t.boolean "visible", default: true
    t.datetime "visible_from"
    t.datetime "visible_to"
    t.integer "default_width"
    t.integer "default_height"
    t.integer "default_thumb_width"
    t.integer "default_thumb_height"
    t.integer "watermark_font_size"
    t.string "watermark_font_family"
    t.string "watermark_font_color"
    t.string "watermark_text"
    t.oid "watermark_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gallery_translations", force: :cascade do |t|
    t.integer "gallery_id", null: false
    t.string "locale", null: false
    t.string "name"
    t.string "slug"
    t.boolean "in_site_map"
    t.index ["gallery_id", "locale", "slug"], name: "index_gallery_translations_on_gallery_id_and_locale_and_slug"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.boolean "url"
  end

  create_table "list_subscribers", id: false, force: :cascade do |t|
    t.integer "list_id"
    t.integer "subscriber_id"
    t.index ["list_id", "subscriber_id"], name: "index_list_subscribers_on_list_id_and_subscriber_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "sender_name"
    t.string "sender_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_file_translations", force: :cascade do |t|
    t.integer "media_file_id", null: false
    t.boolean "in_site_map"
    t.string "locale", null: false
    t.string "name"
    t.string "description"
    t.string "slug"
    t.index ["media_file_id", "locale", "slug"], name: "idx_mf_translations_mf_id_locale_slug"
  end

  create_table "media_files", force: :cascade do |t|
    t.integer "gallery_id"
    t.boolean "default"
    t.string "author"
    t.string "file_type"
    t.oid "file"
    t.boolean "for_logged"
    t.boolean "visible", default: true
    t.datetime "visible_from"
    t.datetime "visible_to"
    t.string "url"
    t.string "url_target"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_item_translations", force: :cascade do |t|
    t.integer "menu_item_id", null: false
    t.string "locale", null: false
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_item_id", "locale", "slug"], name: "idx_menu_item_translations_menu_item_locale_slug"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "data_type", null: false
    t.string "code"
    t.string "extra_attributes"
    t.string "fa_icon"
    t.integer "article_id"
    t.integer "category_id"
    t.integer "gallery_id"
    t.integer "form_id"
    t.boolean "for_logged"
    t.boolean "visible", default: true
    t.datetime "visible_from"
    t.datetime "visible_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id", "gallery_id", "category_id", "form_id"], name: "idx_menu_items_article_gallery_category_form"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.text "body"
    t.integer "list_id"
    t.datetime "send_date"
    t.boolean "use_footer_template"
    t.boolean "send_to_all_users"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queued_emails", force: :cascade do |t|
    t.string "email_to"
    t.string "email_from"
    t.string "email_template_code"
    t.string "subject"
    t.text "body"
    t.string "cc_list"
    t.string "bcc_list"
    t.integer "status"
    t.text "message"
    t.integer "user_id"
    t.text "mailer_setup"
    t.text "variables"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sategories", force: :cascade do |t|
    t.string "code"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "site_settings", force: :cascade do |t|
    t.string "domain_address"
    t.string "aliases"
    t.string "ga_tracking_id"
    t.oid "logo"
    t.oid "favicon"
    t.string "owner_name"
    t.string "company_name"
    t.string "opening_hours"
    t.string "meta_tags"
    t.text "meta_description"
    t.string "contact_fax"
    t.string "contact_phone"
    t.string "contact_skype"
    t.string "contact_facebook"
    t.string "contact_www"
    t.string "contact_email"
    t.string "smtp_domain"
    t.string "smtp_address"
    t.string "smtp_user_name"
    t.string "smtp_password"
    t.string "smtp_port"
    t.boolean "smtp_starttls_auto"
    t.boolean "smtp_ssl"
    t.boolean "smtp_tls"
    t.integer "smtp_authentication_type", default: 0
    t.string "smtp_from"
    t.string "smtp_cc_list"
    t.string "smtp_bcc_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "newsletter_footer"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "active"
    t.string "activation_code"
    t.string "deactivation_code"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "album_id"
    t.string "artist"
    t.string "title"
    t.text "lyrics"
    t.string "url"
    t.datetime "release_date"
    t.oid "audio_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.text "description"
    t.oid "file"
    t.string "file_type"
    t.string "file_name"
    t.string "file_extension"
    t.string "slug"
    t.boolean "visible"
    t.boolean "for_logged"
    t.string "owner"
    t.datetime "publish_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_forms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "form_id", null: false
    t.integer "article_id"
    t.text "body"
    t.boolean "visible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "form_id"], name: "index_user_forms_on_user_id_and_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "status"
    t.oid "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
