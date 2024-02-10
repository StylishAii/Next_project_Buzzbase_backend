class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :actor, null: false, foreign_key: { to_table: :users }
      t.string :event_type, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
  end
end
