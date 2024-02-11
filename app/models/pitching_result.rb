class PitchingResult < ApplicationRecord
  belongs_to :game_result
  belongs_to :user

  def self.pitching_aggregate_for_user(user_id)
    pitching_aggregate_query.where(user_id:).group(:user_id)
  end

  def self.pitching_aggregate_query
    select('user_id',
           'COUNT(game_result_id) AS number_of_appearances',
           'SUM(win) AS win', # 勝利数
           'SUM(CASE WHEN got_to_the_distance THEN 1 ELSE 0 END) AS complete_games', # 完投数
           'SUM(CASE WHEN got_to_the_distance = \'t\' AND run_allowed = 0 THEN 1 ELSE 0 END) AS shutouts', # 完封数
           'SUM(loss) AS loss', # 敗戦数
           'SUM(hold) AS hold', # ホールド数
           'SUM(saves) AS saves', # セーブ数
           'ROUND(SUM(innings_pitched)::numeric, 2) AS innings_pitched', # 投球回数
           'SUM(hits_allowed) AS hits_allowed', # 被安打数
           'SUM(home_runs_hit) AS home_runs_hit', # 被本塁打数
           'SUM(strikeouts) AS strikeouts', # 奪三振数
           'SUM(base_on_balls) AS base_on_balls', # 与四球数
           'SUM(hit_by_pitch) AS hit_by_pitch', # 与死球数
           'SUM(run_allowed) AS run_allowed', # 失点数
           'SUM(earned_run) AS earned_run') # 自責点数
      .group('user_id')
  end

  def self.pitching_stats_for_user(user_id)
    result = pitching_aggregate_query.find_by(user_id:)

    return nil unless result

    stats = result.attributes
    innings_pitched = stats['innings_pitched'].to_f
    wins = stats['win'].to_i
    losses = stats['loss'].to_i
    complete_games = stats['complete_games'].to_i
    shutouts = stats['shutouts'].to_i

    {
      user_id:,
      era: innings_pitched.zero? ? 0 : (stats['earned_run'].to_f * 9 / innings_pitched).round(2),
      complete_games:,
      shutouts:,
      win_percentage: (wins + losses).zero? ? 0 : (wins.to_f / (wins + losses)).round(3),
      k_per_nine: innings_pitched.zero? ? 0 : (stats['strikeouts'].to_f * 9 / innings_pitched).round(3),
      whip: innings_pitched.zero? ? 0 : ((stats['base_on_balls'].to_f + stats['hits_allowed'].to_f) / innings_pitched).round(3),
      bb_per_nine: innings_pitched.zero? ? 0 : (stats['base_on_balls'].to_f * 9 / innings_pitched).round(3),
      k_bb: stats['base_on_balls'].to_i.zero? ? 0 : (stats['strikeouts'].to_f / stats['base_on_balls']).round(3)
    }
  end
end
