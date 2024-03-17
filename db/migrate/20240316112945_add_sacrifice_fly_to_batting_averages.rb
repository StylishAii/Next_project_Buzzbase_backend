class AddSacrificeFlyToBattingAverages < ActiveRecord::Migration[7.0]
  def change
    add_column :batting_averages, :sacrifice_fly, :integer
  end
end
