module Api
  module V1
    class TournamentsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]
      before_action :set_tournament, only: %i[show update]

      def index
        @tournaments = Tournament.all
        render json: @tournaments
      end

      def show
        if @tournament
          render json: { name: @tournament.name }
        else
          render json: { error: '大会名が見つかりません。' }, status: :not_found
        end
      end

      def create
        tournament = Tournament.new(tournament_params)
        if tournament.save
          render json: tournament, status: :created
        else
          render json: tournament.errors, status: :unprocessable_entity
        end
      end

      def update
        if @tournament.update(tournament_params)
          render json: @tournament, status: :ok
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      end

      private

      def set_tournament
        @tournament = Tournament.find(params[:id])
      end

      def tournament_params
        params.require(:tournament).permit(:name)
      end
    end
  end
end
