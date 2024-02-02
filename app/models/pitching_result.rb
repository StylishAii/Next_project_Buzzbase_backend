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
           'SUM(loss) AS loss', # 敗戦数
           'SUM(hold) AS hold', # ホールド数
           'SUM(saves) AS saves', # セーブ数
           'SUM(innings_pitched) AS innings_pitched', # 投球回数
           'SUM(home_runs_hit) AS home_runs_hit', # 被本塁打数
           'SUM(strikeouts) AS strikeouts', # 奪三振数
           'SUM(base_on_balls) AS base_on_balls', # 与四球数
           'SUM(hit_by_pitch) AS hit_by_pitch', # 与死球数
           'SUM(run_allowed) AS run_allowed', # 失点数
           'SUM(earned_run) AS earned_run') # 自責点数
      .group('user_id')
  end
end
