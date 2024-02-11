module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[index destroy]

      def index
        user_id = params[:user_id]

        return head :forbidden unless current_api_v1_user.user_id == user_id

        notifications = current_api_v1_user.notifications.includes(:actor).order(created_at: :desc)
        json_notifications = notifications.map do |notification|
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
            group_invitation = GroupInvitation.find_by(group_id: notification.event_id, user_id: current_api_v1_user.id, state: :pending)
            if group_invitation
              notification_hash[:group_invitation] = group_invitation.state
            else
              next
            end
          end
          notification_hash
        end.compact
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

    end
  end
end
