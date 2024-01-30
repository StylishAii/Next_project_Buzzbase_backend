class AddBattingPositionIdAndPlateResultIdToPlateAppearances < ActiveRecord::Migration[7.0]
  def change
    add_column :plate_appearances, :batting_position_id, :integer
    add_column :plate_appearances, :plate_result_id, :integer
  end
end
