class DropUserTeams < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_teams
  end
end
