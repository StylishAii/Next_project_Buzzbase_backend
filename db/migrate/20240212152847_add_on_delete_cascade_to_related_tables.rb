class AddOnDeleteCascadeToRelatedTables < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :plate_appearances, :game_results
    add_foreign_key :plate_appearances, :game_results, on_delete: :cascade
  end
end
