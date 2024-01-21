class CreatePitchingResults < ActiveRecord::Migration[7.0]
  def change
    create_table :pitching_results do |t|
      t.references :game_result, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :win
      t.integer :loss
      t.integer :hold
      t.integer :save
      t.integer :innings_pitched
      t.integer :number_of_pitches
      t.boolean :got_to_the_distance
      t.integer :run_allowed
      t.integer :earned_run
      t.integer :hits_allowed
      t.integer :home_runs_hit
      t.integer :strikeouts
      t.integer :base_on_balls
      t.integer :hit_by_pitch

      t.timestamps
    end
  end
end
