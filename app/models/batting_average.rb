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
      .group('user_id')
  end

  def self.stats_for_user(user_id)
    result = unscoped.where(user_id:).select(
      'SUM(hit + two_base_hit + three_base_hit + home_run) AS total_hits',
      'SUM(at_bats) AS at_bats',
      'SUM(hit_by_pitch + base_on_balls) AS on_base',
      'SUM(sacrifice_hit) AS sacrifice_hits',
      'SUM(strike_out) AS strike_outs',
      'SUM(base_on_balls) AS walks'
    ).reorder(nil).take

    return nil unless result

    stats = result.attributes
    {
      batting_average: stats['at_bats'].to_i.zero? ? 0 : (stats['total_hits'].to_f / stats['at_bats'].to_i).round(3),
      on_base_percentage: (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i).zero? ? 0 : ((stats['total_hits'].to_f + stats['on_base'].to_i).to_f / (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i)).round(3),
      iso: stats['at_bats'].to_i.zero? ? 0 : ((stats['two_base_hit'].to_i + (stats['three_base_hit'].to_i * 2) + (stats['home_run'].to_i * 3)).to_f / stats['at_bats'].to_i).round(3),
      ops: calculate_ops(stats).round(3),
      bb_per_k: stats['strike_outs'].to_i.zero? ? 0 : (stats['walks'].to_f / stats['strike_outs'].to_i).round(3),
      isod: calculate_isod(stats).round(3)
    }
  end

  def self.calculate_ops(stats)
    slugging_percentage = stats['at_bats'].to_i.zero? ? 0 : (stats['total_hits'].to_f + (stats['two_base_hit'].to_i * 2) + (stats['three_base_hit'].to_i * 3) + (stats['home_run'].to_i * 4)).to_f / stats['at_bats'].to_i
    on_base_percentage = (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i).zero? ? 0 : (stats['total_hits'].to_f + stats['on_base'].to_i).to_f / (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i)
    (on_base_percentage + slugging_percentage).round(3)
  end

  def self.calculate_isod(stats)
    batting_average = stats['at_bats'].to_i.zero? ? 0 : stats['total_hits'].to_f / stats['at_bats'].to_i
    on_base_percentage = (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i).zero? ? 0 : (stats['total_hits'].to_f + stats['on_base'].to_i).to_f / (stats['at_bats'].to_i + stats['on_base'].to_i + stats['sacrifice_hits'].to_i)
    (on_base_percentage - batting_average).round(3)
  end
end
