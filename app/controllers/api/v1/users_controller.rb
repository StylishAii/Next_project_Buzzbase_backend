module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[update show_current]
      before_action :set_user, only: %i[show_current_user_id]

      def show_current
        render json: { id: current_api_v1_user.id }
      end

      def show_current_user_id
        if @user
          render json: { user_id: @user.user_id }
        else
          render json: { error: 'ユーザーが見つかりません。' }, status: :not_found
        end
      end

      def show_by_user_id
        user = User.find_by(user_id: params[:user_id])
        if user
          render json: { id: user.id }
        else
          render json: { error: 'ユーザーが存在しません' }
        end
      end

      def show_user_id_data
        user = User.find_by(user_id: params[:user_id])
        is_following = current_api_v1_user.following?(user)
        if user
          render json: { user: user.as_json, isFollowing: is_following, following_count: user.following_count, followers_count: user.followers_count }
        else
          render json: { error: 'ユーザーが存在しません' }, status: :not_found
        end
      end

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

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :user_id, :introduction, :image, :team_id)
      end
    end
  end
end
