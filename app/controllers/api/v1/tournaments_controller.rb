module Api
  module V1
    class TournamentsController < ApplicationController
      before_action :set_tournament, only: [:create]

      def index
        @tournaments = Tournament.all
        render json: @tournaments
      end

      def create
        @tournament = Tournament.new(tournament_params)
        if @tournament.save
          render json: @tournament, status: :created, location: @tournament
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
