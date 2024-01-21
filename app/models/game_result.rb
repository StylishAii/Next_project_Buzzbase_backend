class GameResult < ApplicationRecord
  belongs_to :user
  has_one :match_result, dependent: :destroy
  has_many :plate_appearances, dependent: :destroy
end
