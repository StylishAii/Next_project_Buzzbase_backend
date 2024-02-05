module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create]

      def create
        group = current_api_v1_user.groups.build(group_params)
        if group.save
          invite_users(group, invite_user_ids_params)
          render json: group, status: :create
        else
          render json: { erros: group.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def group_params
        params.require(:group).permit(:name, :icon)
      end

      def invite_user_ids_params
        params[:invite_user_ids] || []
      end

    end
  end
end
