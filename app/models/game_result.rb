class GameResult < ApplicationRecord
  belongs_to :user
  has_one :match_result, dependent: :destroy
  has_many :plate_appearances, dependent: :destroy
  has_one :batting_average, dependent: :destroy
  has_one :pitching_result, dependent: :destroy
end
