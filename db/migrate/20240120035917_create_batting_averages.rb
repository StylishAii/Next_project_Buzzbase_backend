class CreateBattingAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :batting_averages do |t|
      t.references :game_result, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :plate_appearances
      t.integer :times_at_bat
      t.integer :hit
      t.integer :two_base_hit
      t.integer :three_base_hit
      t.integer :home_run
      t.integer :total_bases
      t.integer :runs_batted_in
      t.integer :run
      t.integer :strike_out
      t.integer :base_on_balls
      t.integer :hit_by_pitch
      t.integer :sacrifice_hit
      t.integer :stealing_base
      t.integer :caught_stealing
      t.integer :error

      t.timestamps
    end
  end
end
