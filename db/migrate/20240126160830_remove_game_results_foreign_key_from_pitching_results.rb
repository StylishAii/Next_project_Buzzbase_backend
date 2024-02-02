class RemoveGameResultsForeignKeyFromPitchingResults < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :pitching_results, :game_results
  end
end
