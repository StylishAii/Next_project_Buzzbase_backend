class ChangeTeamIdToTeamInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :team_id, :integer
    add_column :users, :team, :string
  end
end
