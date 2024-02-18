module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]

      def index
        accepted_group_ids = GroupInvitation.where(user_id: current_api_v1_user.id, state: 'accepted').pluck(:group_id)
        groups = Group.where(id: accepted_group_ids)

        render json: groups.as_json(only: %i[id name icon], include: { group_users: { only: %i[user_id group_id] } })
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

      def update
        group = Group.find(params[:id])
        ActiveRecord::Base.transaction do
          group.update!(group_params) if params[:group]
          if params[:invite_user_ids]
            user_ids = params[:invite_user_ids].map(&:to_i)
            group.update_users_by_ids(user_ids, current_api_v1_user)
          end
        end

        render json: group, status: :ok
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end

      def update_group_info
        group = Group.find(params[:id])
        return render json: { error: 'アクセス権限がありません' }, status: :forbidden unless group.group_invitations.exists?(user: current_api_v1_user, state: 'accepted')

        if group.update(group_params)
          render json: group, status: :ok
        else
          render json: { errors: group.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show_group_user
        group = Group.find(params[:id])

        return render json: { error: 'アクセス権限がありません' }, status: :forbidden unless group.group_invitations.exists?(user: current_api_v1_user, state: 'accepted')

        accepted_users = group.accepted_users
        render json: { group:, accepted_users: }
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'グループは存在しません' }, status: :not_found
      end

      def invite_members
        group = Group.find(params[:id])
        return render json: { error: 'アクセス権限がありません' }, status: :forbidden unless group.group_invitations.exists?(user: current_api_v1_user, state: 'accepted')

        user_ids = invite_user_ids_params.map(&:to_i)
        invite_users(group, user_ids)

        render json: { message: '招待を送信しました' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'グループは存在しません' }, status: :not_found
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

          next if group.group_invitations.exists?(user:, state: 'accepted')

          invitation = group.group_invitations.find_or_initialize_by(user:)
          next unless invitation.new_record?

          invitation.state = 'pending'
          invitation.sent_at = Time.current
          invitation.save!

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
