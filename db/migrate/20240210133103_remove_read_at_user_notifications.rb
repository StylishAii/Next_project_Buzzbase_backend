class RemoveReadAtUserNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_notifications, :read_at, :datetime
  end
end
