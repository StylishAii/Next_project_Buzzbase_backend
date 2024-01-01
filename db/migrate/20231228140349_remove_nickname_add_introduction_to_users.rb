class RemoveNicknameAddIntroductionToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :nickname, :string
    add_column :users, :introduction, :text
  end
end
