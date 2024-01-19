class MatchResult < ApplicationRecord
  belongs_to :user
  belongs_to :my_team, class_name: 'Team'
  belongs_to :opponent_team, class_name: 'Team'
  belongs_to :tournament, optional: true

  validates :date_and_time, presence: true
  validates :match_type, presence: true
  validates :my_team_score, presence: true
  validates :opponent_team_score, presence: true
  validates :batting_order, presence: true
  validates :defensive_position, presence: true
end
