class BattingAverage < ApplicationRecord
  belongs_to :game_result
  belongs_to :user

  def self.aggregate_for_user(user_id)
    aggregate_query.where(user_id:).group(:user_id)
  end

  def self.aggregate_query
    select('user_id',
           'COUNT(game_result_id) AS number_of_matches',
           'SUM(times_at_bat) AS times_at_bat',
           'SUM(at_bats) AS at_bats',
           'SUM(hit) AS hit',
           'SUM(two_base_hit) AS two_base_hit',
           'SUM(three_base_hit) AS three_base_hit',
           'SUM(home_run) AS home_run',
           'SUM(total_bases) AS total_bases',
           'SUM(runs_batted_in) AS runs_batted_in',
           'SUM(run) AS run',
           'SUM(strike_out) AS strike_out',
           'SUM(base_on_balls) AS base_on_balls',
           'SUM(hit_by_pitch) AS hit_by_pitch',
           'SUM(sacrifice_hit) AS sacrifice_hit',
           'SUM(stealing_base) AS stealing_base',
           'SUM(caught_stealing) AS caught_stealing',
           'SUM(error) AS error')
  end
end
