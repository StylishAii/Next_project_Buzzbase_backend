class RenameSaveToSavesInPitchingResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :pitching_results, :save, :saves
  end
end
