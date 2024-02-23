module Api
  module V1
    class AwardsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :set_user, only: %i[create index destroy update]
      before_action :set_award_by_user, only: %i[index_user_id]

      def index
        @award = @user.awards
        render json: @award
      end

      def index_user_id
        if @user_award
          @awards = @user_award.awards
          render json: @awards
        else
          render json: { error: 'ユーザーが見つかりません。' }, status: :not_found
        end
      end

      def create
        title = award_params[:title]
        user_id = params[:user_id]

        award = Award.find_or_create_by(title:)
        user = User.find(user_id)
        user.awards << award unless user.awards.include?(award)

        if user.save
          render json: award, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def update
        award = @user.awards.find(params[:id])
        if award.update(award_params)
          render json: award, status: :ok
        else
          render json: award.errors, status: :unprocessable_entity
        end
      end

      def destroy
        user_id = params[:user_id]
        award_id = params[:id]
        user_award = UserAward.find_by(user_id:, award_id:)
        if user_award.destroy
          award = Award.find_by(id: award_id)
          award.destroy if award.present?
          render json: { message: '受賞タイトルが削除されました' }, status: :ok
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

      def set_award_by_user
        @user_award = User.find_by(user_id: params[:user_id])
        render json: { error: 'ユーザーが見つかりません。' }, status: :not_found unless @user_award
      end

    end
  end
end
