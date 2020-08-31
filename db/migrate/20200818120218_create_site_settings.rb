class CreateSiteSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :site_settings, force: :cascade do |t|
      t.string :domain_address
      t.string :aliases
      t.string :ga_tracking_id
      t.column :logo, :oid
      t.column :favicon, :oid
      t.string :owner_name
      t.string :company_name
      t.string :opening_hours
      t.string :meta_tags
      t.text :meta_description
      t.string :contact_fax
      t.string :contact_phone
      t.string :contact_skype
      t.string :contact_facebook
      t.string :contact_www
      t.string :contact_email
      t.string :smtp_domain
      t.string :smtp_address
      t.string :smtp_user_name
      t.string :smtp_password
      t.string :smtp_port
      t.boolean :smtp_starttls_auto
      t.boolean :smtp_ssl
      t.boolean :smtp_tls
      t.integer :smtp_authentication_type, default: 0
      t.string :smtp_from
      t.string :smtp_cc_list
      t.string :smtp_bcc_list
      t.timestamps
    end
  end
end
