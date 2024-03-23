class CreateBaseballNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :baseball_notes do |t|
      t.string :title
      t.date :date
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
