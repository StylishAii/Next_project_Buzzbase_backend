class GameResult < ApplicationRecord
  belongs_to :user
  has_one :match_result, dependent: :destroy
  has_many :plate_appearances, dependent: :destroy
  has_one :batting_average, dependent: :destroy
  has_one :pitching_result, dependent: :destroy

  def self.game_associated_data_user(user)
    includes(:match_result, :batting_average, :pitching_result)
      .where(user:)
      .joins(:match_result)
      .order('match_results.date_and_time DESC')
      .map do |game_result|
      {
        game_result_id: game_result.id,
        match_result: game_result.match_result,
        batting_average: game_result.batting_average,
        pitching_result: game_result.pitching_result
      }
    end
  end
end
