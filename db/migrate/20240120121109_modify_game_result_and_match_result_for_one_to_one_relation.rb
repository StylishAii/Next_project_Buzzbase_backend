class ModifyGameResultAndMatchResultForOneToOneRelation < ActiveRecord::Migration[7.0]
  def change
    change_column_null :match_results, :game_result_id, true
  end
end
