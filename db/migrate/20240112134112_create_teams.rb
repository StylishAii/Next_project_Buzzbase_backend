class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :category, foreign_key: { to_table: :baseball_categories }
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
