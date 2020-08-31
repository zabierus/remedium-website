class CreateContactRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_requests, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.timestamps null: false
    end
  end
end
