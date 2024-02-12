class AddOnDeleteCascadeToGameResults < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :game_results, :match_results
    add_foreign_key :game_results, :match_results, on_delete: :cascade
  end
end
