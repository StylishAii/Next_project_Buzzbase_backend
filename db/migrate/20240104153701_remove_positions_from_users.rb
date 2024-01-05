class RemovePositionsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :positions, :text
  end
end
