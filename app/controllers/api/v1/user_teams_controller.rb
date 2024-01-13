module Api
  module V1
    class UserTeamsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_user_team, only: [:update]

      def update
        if @user_team.update(user_team_params)
          render json: @user_team, status: :ok
        else
          render json: @user_team.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user_team
        @user_team = UserTeam.find_or_initialize_by(user_id: current_api_v1_user.id)
      end

      def user_team_params
        params.require(:user_team).permit(:team_id, :user_id)
      end
    end
  end
end
