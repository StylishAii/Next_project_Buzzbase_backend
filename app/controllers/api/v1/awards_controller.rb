module Api
  module V1
    class AwardsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_user, only: %i[create index destroy]

      def index
        @award = @user.awards
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

      def destroy
        user_award = @user.user_awards.find_by(award_id: params[:id])
        if user_award.destroy
          render json: { message: 'Award deleted successfully' }, status: :ok
        else
          render json: user_award.errors, status: :unprocessable_entity
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
