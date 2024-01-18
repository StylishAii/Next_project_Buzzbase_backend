class RenameTeamIdColumnsInMatchResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :match_results, :my_team_id_id, :my_team_id
    rename_column :match_results, :opponent_team_id_id, :opponent_team_id
  end
end
