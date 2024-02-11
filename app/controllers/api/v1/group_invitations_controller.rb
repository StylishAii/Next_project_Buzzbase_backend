module Api
  module V1
    class GroupInvitationsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def accept_invitation
        group_id = params[:id]
        invitation = GroupInvitation.find_by(group_id: group_id, user_id: current_api_v1_user.id)
        if invitation
          invitation.accepted!
          render json: {success: true}
        else
          render json: {error: "招待状況が見つかりません"}, status: :not_found
        end
      end

    end
  end
end