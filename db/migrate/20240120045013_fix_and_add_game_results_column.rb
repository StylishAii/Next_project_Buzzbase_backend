class FixAndAddGameResultsColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_results, :batting_average, foreign_key: true
    add_reference :game_results, :pitching_result, foreign_key: true
    change_column_null :game_results, :match_result_id, true
  end
end
