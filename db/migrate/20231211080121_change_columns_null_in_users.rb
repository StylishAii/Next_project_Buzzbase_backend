class ChangeColumnsNullInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :user_id, true
  end
end
