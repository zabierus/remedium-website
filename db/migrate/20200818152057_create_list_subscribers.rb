class CreateListSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :list_subscribers, id: false, force: :cascade do |t|
      t.integer :list_id
      t.integer :subscriber_id
    end

    add_index :list_subscribers, [:list_id, :subscriber_id]
  end
end
