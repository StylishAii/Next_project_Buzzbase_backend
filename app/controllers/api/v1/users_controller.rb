module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!

      def show
        render json: current_api_v1_user
      end

      def update
        if current_api_v1_user.update(user_params)
          render json: { success: true }
        else
          render json: { errors: current_api_v1_user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :user_id, :introduction, :image, :team_id)
      end
    end
  end
end
