class GameResult < ApplicationRecord
  belongs_to :user
  has_one :match_result, dependent: :destroy
end
