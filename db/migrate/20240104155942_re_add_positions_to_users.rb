class ReAddPositionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :positions, :text
  end
end
