class CreateGameResults < ActiveRecord::Migration[7.0]
  def change
    create_table :game_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match_result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
