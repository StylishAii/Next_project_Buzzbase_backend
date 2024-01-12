class Team < ApplicationRecord
  belongs_to :category, class_name: 'BaseballCategory'
  belongs_to :prefecture

  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
end
