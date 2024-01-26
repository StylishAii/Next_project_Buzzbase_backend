class RemoveGameResultsForeignKeyFromBattingAverages < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :batting_averages, :game_results
  end
end
