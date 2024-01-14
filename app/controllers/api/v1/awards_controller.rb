module Api
  module V1
    class AwardsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_user, only: %i[create index]

      def index
        @award = Award.all
        render json: @award
      end

      def create
        award = Award.find_or_create_by(title: award_params[:title])
        @user.awards << award unless @user.awards.include?(award)
        if @user.save
          render json: award, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def award_params
        params.require(:award).permit(:title, :userId)
      end

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
