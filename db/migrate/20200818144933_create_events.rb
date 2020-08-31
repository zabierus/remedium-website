class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, force: :cascade do |t|
      t.integer :event_type_id
      t.integer :user_id
      t.datetime :start_at
      t.datetime :end_at
      t.string :title
      t.string :venue
      t.string :location
      t.text :desc
      t.text :link
      t.string :external_id
      t.timestamps
    end
  end
end
