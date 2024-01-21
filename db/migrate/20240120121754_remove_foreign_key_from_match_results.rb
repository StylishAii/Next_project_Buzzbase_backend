class RemoveForeignKeyFromMatchResults < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :match_results, :game_results
  end
end
