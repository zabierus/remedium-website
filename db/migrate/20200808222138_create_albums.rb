class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums, force: :cascade do |t|
      t.integer :track_id, null: false
      t.string :title
      t.string :cover
      t.datetime :release_date
      t.timestamps null: false
    end
  end
end
