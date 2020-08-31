class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters, force: :cascade do |t|
      t.string :name
      t.string :subject
      t.text :body, limit: 1.megabyte
      t.integer :list_id
      t.datetime :send_date
      t.boolean :use_footer_template
      t.boolean :send_to_all_users
      t.timestamps
    end

    add_column :site_settings, :newsletter_footer, :text, limit: 512.kilobytes
  end
end
