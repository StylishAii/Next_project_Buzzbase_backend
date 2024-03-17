module Api
  module V1
    class BattingAveragesController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update search current_batting_average_search]
      before_action :set_batting_average, only: %i[update]

      def index
        batting_averages = BattingAverage.includes(:user, :game_result)
        render json: batting_averages
      end

      def create
        batting_average = BattingAverage.new(batting_average_params)
        if batting_average.save
          render json: batting_average, status: :created
        else
          render json: batting_average.errors, status: :unprocessable_entity
        end
      end

      def update
        if @batting_average.update(batting_average_params)
          render json: @batting_average
        else
          render json: @batting_average.errors, status: :unprocessable_entity
        end
      end

      def search
        @batting_average = BattingAverage.find_by(game_result_id: params[:game_result_id], user_id: params[:user_id])
        if @batting_average
          render json: @batting_average
        else
          render json: { message: 'No matching record found' }, status: :not_found
        end
      end

      def current_batting_average_search
        if params[:game_result_id].present?
          batting_average = BattingAverage.where(game_result_id: params[:game_result_id], user_id: current_api_v1_user.id)
          if batting_average.present?
            render json: batting_average
          else
            render json: []
          end
        else
          render json: []
        end
      end

      def user_batting_average_search
        if params[:game_result_id].present?
          batting_average = BattingAverage.where(game_result_id: params[:game_result_id])
          if batting_average.present?
            render json: batting_average
          else
            render json: []
          end
        else
          render json: []
        end
      end

      def personal_batting_average
        user_id = params[:user_id]
        aggregated_data = BattingAverage.aggregate_for_user(user_id)
        render json: aggregated_data
      end

      def personal_batting_stats
        user_id = params[:user_id]
        batting_stats = BattingAverage.stats_for_user(user_id)
        if batting_stats.present?
          render json: batting_stats
        else
          render json: { error: 'Batting average not found for current user' }, status: :not_found
        end
      end

      private

      def set_batting_average
        @batting_average = BattingAverage.find(params[:id])
      end

      def batting_average_params
        params.require(:batting_average).permit(
          :game_result_id, :user_id, :plate_appearances, :times_at_bat, :hit,
          :two_base_hit, :three_base_hit, :home_run, :total_bases, :runs_batted_in,
          :run, :strike_out, :base_on_balls, :hit_by_pitch, :sacrifice_hit, :sacrifice_fly,
          :stealing_base, :caught_stealing, :error, :at_bats
        )
      end
    end
  end
end
