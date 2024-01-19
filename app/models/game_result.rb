class GameResult < ApplicationRecord
  belongs_to :user
  belongs_to :match_result
end
