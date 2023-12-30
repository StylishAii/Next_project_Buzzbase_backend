class CreateUserPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_positions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
