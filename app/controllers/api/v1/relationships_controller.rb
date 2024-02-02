module Api
  module V1
    class RelationshipsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def create
        user = User.find(params[:followed_id])
        if current_api_v1_user.follow(user)
          render json: { status: 'success', message: 'User followed successfully.' }, status: :created
        else
          render json: { status: 'error', message: 'Unable to follow user.' }, status: :unprocessable_entity
        end
      end

      def destroy
        relationship = current_api_v1_user.active_relationships.find_by(followed_id: params[:id])
        if relationship&.destroy
          render json: { status: 'success', message: 'User unfollowed successfully.' }, status: :ok
        else
          render json: { status: 'error', message: 'Unable to unfollow user.' }, status: :unprocessable_entity
        end
      end
    end
  end
end
