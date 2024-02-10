module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create]

      def index
        if params[:userId]
          user_id = params[:userId]
          groups = Group.joins(:group_users).where(group_users: { user_id: })
        end
        render json: groups
      end

      def show
        group = Group.find(params[:id])

        return render json: { error: 'アクセス権限がありません' }, status: :forbidden unless group.group_invitations.exists?(user: current_api_v1_user, state: 'accepted')

        accepted_users = group.accepted_users
        batting_averages = accepted_users.map do |user|
          BattingAverage.aggregate_for_user(user.id)
        end
        batting_stats = accepted_users.map do |user|
          BattingAverage.stats_for_user(user.id)
        end
        pitching_aggregate = accepted_users.map do |user|
          PitchingResult.pitching_aggregate_for_user(user.id)
        end
        pitching_stats = accepted_users.map do |user|
          PitchingResult.pitching_stats_for_user(user.id)
        end
        render json: { group:, accepted_users:, batting_averages:, batting_stats:, pitching_aggregate:, pitching_stats: }
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'グループは存在しません' }, status: :not_found
      end

      def create
        group = current_api_v1_user.groups.build(group_params)
        if group.save
          group.users << current_api_v1_user
          group.group_invitations.create(user: current_api_v1_user, state: 'accepted', sent_at: Time.current)
          invite_users(group, invite_user_ids_params)
          render json: group, status: :created
        else
          render json: { errors: group.errors.full_messages }, status: :unprocessable_entity
        end
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
          next unless user && current_api_v1_user.following.include?(user)

          group.group_invitations.create(user:, state: 'pending', sent_at: Time.current)
          notification = Notification.create!(
            actor: current_api_v1_user,
            event_type: 'group_invitation',
            event_id: group.id
          )
          UserNotification.create!(
            user_id: user.id,
            notification_id: notification.id
          )
        end
      end
    end
  end
end
