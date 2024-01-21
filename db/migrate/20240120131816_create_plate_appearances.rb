class CreatePlateAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :plate_appearances do |t|
      t.references :game_results, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :batter_box_number
      t.string :batting_result

      t.timestamps
    end
  end
end
