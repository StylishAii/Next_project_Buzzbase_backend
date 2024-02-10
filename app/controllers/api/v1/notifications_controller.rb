module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[index]

      def index
        notifications = current_api_v1_user.notifications.includes(:actor).order(created_at: :desc)
        json_notifications = notifications.map do |notification|
          notification_hash = {
            id: notification.id,
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
          end
          notification_hash
        end
        render json: json_notifications
      end
    end
  end
end
