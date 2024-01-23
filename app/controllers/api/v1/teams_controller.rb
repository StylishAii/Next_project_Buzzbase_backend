module Api
  module V1
    class TeamsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]
      before_action :set_team, only: %i[update team_name]

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

      def update
        if @team.update(team_params)
          render json: @team, status: :ok
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def team_name
        if @team
          render json: {name: @team.name}
        else
          render json: { error: 'チームが見つかりません。' }, status: :not_found
        end
      end

      private

      def set_team
        @team = Team.find(params[:id])
      end

      def team_params
        params.require(:team).permit(:name, :category_id, :prefecture_id)
      end
    end
  end
end
