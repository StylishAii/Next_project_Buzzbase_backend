class RemoveNullConstrainFromTeams < ActiveRecord::Migration[7.0]
  def change
    change_column_null :teams, :prefecture_id, true
  end
end
