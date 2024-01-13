class RemoveNullConstrainFromUserTeams < ActiveRecord::Migration[7.0]
  def change
    change_column_null :user_teams, :user_id, true
    change_column_null :user_teams, :team_id, true
  end
end
