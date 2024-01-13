module Api
  module V1
    class TeamsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        @teams = Team.all
        render json: @teams
      end

      def create
        team = Team.find_or_create_by(team_params)
        if team.persisted?
          render json: team, status: :created
        else
          render json: team.errors, status: :unprocessable_entity
        end
      end

      private

      def team_params
        params.require(:team).permit(:name, :category_id, :prefecture_id)
      end
    end
  end
end
