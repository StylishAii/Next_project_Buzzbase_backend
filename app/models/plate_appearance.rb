class PlateAppearance < ApplicationRecord
  belongs_to :game_result
  belongs_to :user
end
