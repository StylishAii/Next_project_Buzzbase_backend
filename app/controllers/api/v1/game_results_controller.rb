module Api
  module V1
    class GameResultsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]
      before_action :set_game_result, only: %i[update]

      def index
        GameResults.includes(:user, :match_results).ApplicationController
        render json: game_results_params
      end

      def create
        game_result = GameResult.new(user_id: current_api_v1_user.id)
        if game_result.save
          render json: game_result, status: :created
        else
          render json: { errors: game_result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @game_result.update(game_results_params)
          render json: @game_result, status: :created
        else
          render json: { errors: @game_result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_game_result
        @game_result = GameResult.find(params[:id])
      end

      def game_results_params
        params.require(:game_result).permit(:user_id, :match_result_id, :batting_average_id, :pitching_result_id)
      end
    end
  end
end
