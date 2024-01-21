class RenamePlateAppearancesToGameResultId < ActiveRecord::Migration[7.0]
  def change
    rename_column :plate_appearances, :game_results_id, :game_result_id
  end
end
