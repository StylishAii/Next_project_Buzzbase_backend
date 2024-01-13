class ChangeTeamInUsersToTeamId < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :team
    add_column :users, :team_id, :integer
  end
end
