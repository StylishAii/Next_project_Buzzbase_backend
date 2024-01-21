class RenameGameIdToGameResultIdInMatchResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :match_results, :game_id, :game_result_id
    change_column :match_results, :game_result_id, :integer, null: false
    add_foreign_key :match_results, :game_results, column: :game_result_id
  end
end
