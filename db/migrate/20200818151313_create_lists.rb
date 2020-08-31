class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.string :sender_name
      t.string :sender_email
      t.timestamps
    end
  end
end
