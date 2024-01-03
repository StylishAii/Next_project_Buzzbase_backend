module Api
  module V1
    class UserPositionsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def create
        user_id = params[:user_id]
        position_ids = params[:position_ids]
        UserPosition.where(user_id:).destroy_all

        position_ids.each do |position_id|
          UserPosition.create(user_id:, position_id:)
        end

        render json: { message: 'Positions updated successfully' }, status: :ok
      end
    end
  end
end
