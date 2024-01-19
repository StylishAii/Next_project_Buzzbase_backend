class CreateMatchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :match_results do |t|
      t.integer :game_id
      t.references :user, null: false, foreign_key: true
      t.datetime :date_and_time, null: false
      t.string :match_type, null: false
      t.references :my_team_id, null: false, foreign_key: { to_table: :teams }
      t.references :opponent_team_id, null: false, foreign_key: { to_table: :teams }
      t.integer :my_team_score, null: false
      t.integer :opponent_team_score, null: false
      t.string :batting_order, null: false
      t.string :defensive_position, null: false
      t.integer :tournament_id, foreign_key: true
      t.text :memo

      t.timestamps
    end
  end
end
