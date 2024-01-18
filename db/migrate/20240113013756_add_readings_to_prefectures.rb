class AddReadingsToPrefectures < ActiveRecord::Migration[7.0]
  def change
    add_column :prefectures, :hiragana, :string
    add_column :prefectures, :katakana, :string
    add_column :prefectures, :alphabet, :string
  end
end
