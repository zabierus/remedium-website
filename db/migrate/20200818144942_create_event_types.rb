class CreateEventTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_types, force: :cascade do |t|
      t.string :name
      t.string :color_rgb
      t.string :font_color_rgb
      t.boolean :default
      t.string :code
    end
  end
end
