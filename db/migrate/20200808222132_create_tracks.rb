class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks, force: :cascade do |t|
      t.integer :album_id
      t.string :artist
      t.string :title
      t.text :lyrics
      t.string :url
      t.datetime :release_date
      t.column :audio_file, :oid
      t.timestamps null: false
    end
    add_index :tracks, :album_id
  end
end
