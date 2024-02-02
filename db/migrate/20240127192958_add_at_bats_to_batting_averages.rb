class AddAtBatsToBattingAverages < ActiveRecord::Migration[7.0]
  def change
    add_column :batting_averages, :at_bats, :integer
  end
end
