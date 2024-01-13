class AddNotNullConstraintToTeams < ActiveRecord::Migration[7.0]
  def change
    change_column :teams, :name, :string, null: false
    change_column :teams, :category_id, :bigint, null: false
    change_column :teams, :prefecture_id, :bigint, null: false
  end
end
