class CreateUserAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :user_awards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :award, null: false, foreign_key: true

      t.timestamps
    end
  end
end
