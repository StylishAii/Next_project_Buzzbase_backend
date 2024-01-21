module Api
  module V1
    class BattingAveragesController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update search]
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

      private

      def set_batting_average
        @batting_average = BattingAverage.find(params[:id])
      end

      def batting_average_params
        params.require(:batting_average).permit(
          :game_result_id, :user_id, :plate_appearances, :times_at_bat, :hit,
          :two_base_hit, :three_base_hit, :home_run, :total_bases, :runs_batted_in,
          :run, :strike_out, :base_on_balls, :hit_by_pitch, :sacrifice_hit,
          :stealing_base, :caught_stealing, :error
        )
      end
    end
  end
end
