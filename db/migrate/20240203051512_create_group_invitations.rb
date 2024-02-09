class CreateGroupInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :group_invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.integer :state
      t.datetime :sent_at
      t.datetime :responded_at

      t.timestamps
    end
  end
end
