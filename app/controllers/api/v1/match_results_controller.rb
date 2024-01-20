module Api
  module V1
    class MatchResultsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :set_match_result, only: %i[show update destroy]

      def index
        @match_results = MatchResult.includes(:user, :tournament, :my_team, :opponent_team).ApplicationController
        render json: @match_results
      end

      def show
        render json: @match_result
      end

      def create
        @match_result = MatchResult.new(match_results_params.merge(user_id: current_api_v1_user.id))
        if @match_result.save
          render json: @match_result, status: :created
        else
          render json: { errors: @match_result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @match_result.update(match_results_params)
          render json: @match_result
        else
          render json: { errors: @match_result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @match_result.destroy
      end

      private

      def set_match_result
        @match_result = MatchResult.find(params[:id])
      end

      def match_results_params
        params.require(:match_result).permit(:user_id, :game_result_id, :date_and_time, :match_type, :my_team_id, :opponent_team_id, :my_team_score,
                                             :opponent_team_score, :batting_order, :defensive_position, :tournament_id, :memo)
      end
    end
  end
end
