class ChangeInningsPitchedToFloatInPitchingResults < ActiveRecord::Migration[7.0]
  def change
    change_column :pitching_results, :innings_pitched, :float
  end
end
