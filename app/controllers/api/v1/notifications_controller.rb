module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[index destroy read count]

      def index
        user_id = params[:user_id]

        return head :forbidden unless current_api_v1_user.user_id == user_id

        notifications = current_api_v1_user.notifications.includes(:actor).order(created_at: :desc)
        filtered_notifications = notifications.select do |notification|
          if notification.event_type == 'group_invitation'
            group_invitation = GroupInvitation.find_by(group_id: notification.event_id, user_id: current_api_v1_user.id)
            group_invitation&.state == 'pending'
          else
            notification.event_type == 'followed'
          end
        end

        json_notifications = filtered_notifications.map do |notification|
          notification_hash = {
            id: notification.id,
            actor_user_id: notification.actor.user_id,
            actor_name: notification.actor.name,
            actor_icon: notification.actor.image,
            event_type: notification.event_type,
            event_id: notification.event_id,
            read_at: notification.read_at,
            created_at: notification.created_at
          }

          if notification.event_type == 'group_invitation'
            group = Group.find_by(id: notification.event_id)
            notification_hash[:group_name] = group&.name
            notification_hash[:group_invitation] = 'pending'
          end

          notification_hash
        end

        render json: json_notifications
      end

      def destroy
        notification = current_api_v1_user.notifications.find_by(id: params[:id])
        if notification
          notification.destroy
          render json: { success: true }, status: :ok
        else
          render json: { error: '削除する通知がありません' }, status: :not_found
        end
      end

      def read
        notification = current_api_v1_user.notifications.find(params[:id])
        notification.update(read_at: Time.current) if notification.read_at.nil?
        render json: { success: true }
      end

      def count
        followed_count = current_api_v1_user.notifications.where(event_type: 'followed', read_at: nil).count
        group_invitation_count = current_api_v1_user.notifications.joins('INNER JOIN group_invitations ON notifications.event_id = group_invitations.group_id')
                                                    .where(notifications: { event_type: 'group_invitation', read_at: nil },
                                                           group_invitations: { user_id: current_api_v1_user.id, state: 'pending' })
                                                    .count

        total_count = followed_count + group_invitation_count
        render json: { count: total_count }
      end
    end
  end
end
