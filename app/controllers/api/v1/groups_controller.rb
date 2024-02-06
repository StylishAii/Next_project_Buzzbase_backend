module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create]

      def index
        groups = Group.includes(:users)
        render json: groups
      end

      def create
        group = current_api_v1_user.groups.build(group_params)
        if group.save
          invite_users(group, invite_user_ids_params)
          render json: group, status: :created
        else
          render json: { errors: group.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        group = Group.find(params[:id])
          render json: group
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'グループは存在しません'}, status: :not_found
      end

      private

      def group_params
        params.require(:group).permit(:name, :icon)
      end

      def invite_user_ids_params
        params[:invite_user_ids] || []
      end

      def invite_users(group, user_ids)
        user_ids.each do |user_id|
          user = User.find_by(id: user_id)
          group.group_invitations.create(user:, state: 'pending', sent_at: Time.current) if user && current_api_v1_user.following.include?(user)
        end
      end
    end
  end
end
