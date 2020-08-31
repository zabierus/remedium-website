class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers, force: :cascade do |t|
      t.string :name
      t.string :email
      t.boolean :active
      t.string :activation_code
      t.string :deactivation_code
      t.integer :user_id
      t.timestamps
    end
  end
end
