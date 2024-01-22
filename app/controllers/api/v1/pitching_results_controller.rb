module Api
  module V1
    class PitchingResultsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update pitching_search]
      before_action :set_pitching_result, only: %i[update]

      def index
        pitching_result = PitchingResults.includes(:user, :game_result)
        render json: pitching_result
      end

      def create
        pitching_result = PitchingResult.new(pitching_result_params)
        if pitching_result.save
          render json: pitching_result, status: :created
        else
          render json: pitching_result.errors, status: :unprocessable_entity
        end
      end

      def update
        if @pitching_result.update(pitching_result_params)
          render json: @pitching_result
        else
          render json: @pitching_result.errors, status: :unprocessable_entity
        end
      end

      def pitching_search
        @pitching_result = PitchingResult.find_by(game_result_id: params[:game_result_id], user_id: params[:user_id])
        if @pitching_result
          render json: @pitching_result
        else
          render json: { message: 'No matching record found' }, status: :not_found
        end
      end

      private

      def set_pitching_result
        @pitching_result = PitchingResult.find(params[:id])
      end

      def pitching_result_params
        params.require(:pitching_result).permit(:game_result_id, :user_id, :win, :loss, :hold, :saves, :innings_pitched, :number_of_pitches,
                                                :got_to_the_distance, :run_allowed, :earned_run, :hits_allowed, :home_runs_hit, :strikeouts,
                                                :base_on_balls, :hit_by_pitch)
      end
    end
  end
end
