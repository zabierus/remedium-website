class BasicCms < ActiveRecord::Migration[6.0]
  def visibility_columns(t)
    t.boolean :for_logged
    t.boolean :visible, default: true
    t.datetime :visible_from
    t.datetime :visible_to
  end

  def change
    create_table :articles, force: :cascade do |t|
      t.string :code
      t.string :author
      t.boolean :news
      t.boolean :archived
      t.column :image, :oid
      visibility_columns(t)
      t.timestamps
    end

    create_table :article_translations, force: :cascade do |t|
      t.integer :article_id, null: false
      t.string :locale, null: false
      t.boolean :in_site_map
      t.string :name
      t.text :body, limit: 1.megabyte
      t.text :meta_tags
      t.string :meta_title
      t.text :meta_description
      t.string :slug
    end

    add_index :article_translations, [:article_id, :locale, :slug]

    create_table :banners, force: :cascade do |t|
      t.string :code
      t.integer :banner_items_count
      t.timestamps
    end

    create_table :banner_items, force: :cascade do |t|
      t.integer :banner_id, null: false
      t.column :file, :oid
      t.string :url
      t.string :url_target
      t.integer :clicks_count
      t.integer :position
      visibility_columns(t)
      t.timestamps
    end

    create_table :banner_item_translations, force: :cascade do |t|
      t.integer :banner_item_id, null: false
      t.string :locale, null: false
      t.boolean :in_site_map
      t.string :name
      t.string :title
      t.text :description
      t.string :button_name
    end

    add_index :banner_item_translations, [:banner_item_id, :locale]

    create_table :sategories, force: :cascade do |t|
      t.string :code
      t.integer :position
      t.timestamps
    end

    create_table :category_translations, force: :cascade do |t|
      t.integer :category_id, null: false
      t.string :locale, null: false
      t.string :name
      t.string :slug
    end

    add_index :category_translations, [:category_id, :locale, :slug]

    create_table :categories_articles, id: false, force: :cascade do |t|
      t.integer :category_id, null: false
      t.integer :article_id, null: false
    end

    add_index :categories_articles, [:category_id, :article_id]

    create_table :galleries, force: :cascade do |t|
      t.boolean :categorization
      t.string :code, null: false
      visibility_columns(t)
      t.integer :default_width
      t.integer :default_height
      t.integer :default_thumb_width
      t.integer :default_thumb_height
      t.integer :watermark_font_size
      t.string :watermark_font_family
      t.string :watermark_font_color
      t.string :watermark_text
      t.column :watermark_image, :oid
      t.timestamps
    end

    create_table :gallery_translations, force: :cascade do |t|
      t.integer :gallery_id, null: false
      t.string :locale, null: false
      t.string :name
      t.string :slug
      t.boolean :in_site_map
    end

    add_index :gallery_translations, [:gallery_id, :locale, :slug]

    create_table :media_files, force: :cascade do |t|
      t.integer :gallery_id
      t.boolean :default
      t.string :author
      t.string :file_type
      t.column :file, :oid
      visibility_columns(t)
      t.string :url
      t.string :url_target
      t.integer :position
      t.timestamps
    end

    create_table :media_file_translations, force: :cascade do |t|
      t.integer :media_file_id, null: false
      t.boolean :in_site_map
      t.string :locale, null: false
      t.string :name
      t.string :description
      t.string :slug
    end

    add_index :media_file_translations, [:media_file_id, :locale, :slug], name: "idx_mf_translations_mf_id_locale_slug"

    create_table :categories_media_files, id: false, force: :cascade do |t|
      t.integer :category_id, null: false
      t.integer :media_file_id, null: false
    end

    add_index :categories_media_files, [:category_id, :media_file_id]

    create_table :forms, force: :cascade do |t|
      t.integer :article_id
      t.string :code
      t.timestamps
    end

    create_table :form_translations, force: :cascade do |t|
      t.integer :form_id, null: false
      t.string :name
      t.text :body
      t.string :slug
      t.string :locale, null: false
    end

    add_index :form_translations, [:form_id, :locale, :slug], name: "idx_form_translations_form_id_locale_slug"

    create_table :user_forms do |t|
      t.integer :user_id, null: false
      t.integer :form_id, null: false
      t.integer :article_id
      t.text :body
      t.boolean :visible
      t.timestamps
    end

    add_index :user_forms, [:user_id, :form_id]

    create_table :menu_items, force: :cascade do |t|
      t.integer :data_type, null: false
      t.string :code
      t.string :extra_attributes
      t.string :fa_icon
      t.integer :article_id
      t.integer :category_id
      t.integer :gallery_id
      t.integer :form_id
      visibility_columns(t)
      t.timestamps
    end

    add_index :menu_items, [:article_id, :gallery_id, :category_id, :form_id], name: "idx_menu_items_article_gallery_category_form"

    create_table :menu_item_translations, force: :cascade do |t|
      t.integer :menu_item_id, null: false
      t.string :locale, null: false
      t.string :name
      t.string :description
      t.string :slug
      t.timestamps
    end

    add_index :menu_item_translations, [:menu_item_id, :locale, :slug], name: "idx_menu_item_translations_menu_item_locale_slug"

    create_table :uploads, force: :cascade do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.column :file, :oid
      t.string :file_type
      t.string :file_name
      t.string :file_extension
      t.string :slug
      t.boolean :visible
      t.boolean :for_logged
      t.string :owner
      t.datetime :publish_at
      t.timestamps
    end

    create_table :categories_uploads, id: false, force: :cascade do |t|
      t.integer :category_id, null: false
      t.integer :upload_id, null: false
    end

    add_index :categories_uploads, [:category_id, :upload_id]

    create_table :email_templates, force: :cascade do |t|
      t.string :code, null: false
      t.boolean :send
      t.timestamps
    end

    create_table :email_template_translations, force: :cascade do |t|
      t.integer :template_id, null: false
      t.string :locale, null: false
      t.string :title
      t.text :body, limit: 5.megabytes
      t.string :cc_list
      t.string :bcc_list
    end

    add_index :email_template_translations, [:template_id, :locale]

    create_table :keywords, force: :cascade do |t|
      t.string :key
      t.string :value
      t.boolean :url
    end

    create_table :email_template_keywords, id: false do |t|
      t.integer :keyword_id
      t.integer :email_template_id
    end

    create_table :queued_emails do |t|
      t.string :email_to
      t.string :email_from
      t.string :email_template_code
      t.string :subject
      t.text :body, limit: 5.megabytes
      t.string :cc_list
      t.string :bcc_list
      t.integer :status
      t.text :message
      t.integer :user_id
      t.text :mailer_setup
      t.text :variables
      t.timestamps
    end
  end
end
