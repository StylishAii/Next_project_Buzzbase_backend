class AddReadingsToBaseballCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :baseball_categories, :hiragana, :string
    add_column :baseball_categories, :katakana, :string
    add_column :baseball_categories, :alphabet, :string
  end
end
