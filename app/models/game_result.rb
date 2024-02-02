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

  def self.filtered_game_associated_data_user(user, year, match_type)
    game_results = base_query(user)
    game_results = filter_by_year(game_results, year) if year_filter_applicable?(year)
    game_results = filter_by_match_type(game_results, match_type) if match_type_filter_applicable?(match_type)

    map_game_results(game_results)
  end

  def self.base_query(user)
    includes(:match_result, :batting_average, :pitching_result).where(user:)
  end

  def self.year_filter_applicable?(year)
    year.present? && year != '通算'
  end

  def self.filter_by_year(game_results, year)
    start_date = Date.new(year.to_i, 1, 1)
    end_date = Date.new(year.to_i, 12, 31)
    game_results.where(match_results: { date_and_time: start_date..end_date })
  end

  def self.match_type_filter_applicable?(match_type)
    match_type.present? && match_type != '全て'
  end

  def self.filter_by_match_type(game_results, match_type)
    game_results.where(match_results: { match_type: })
  end

  def self.map_game_results(game_results)
    game_results.map do |game_result|
      {
        game_result_id: game_result.id,
        match_result: game_result.match_result,
        batting_average: game_result.batting_average,
        pitching_result: game_result.pitching_result
      }
    end
  end
end