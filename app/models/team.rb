class Team < ApplicationRecord
  belongs_to :category, class_name: 'BaseballCategory', optional: true
  belongs_to :prefecture, optional: true

  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

end
