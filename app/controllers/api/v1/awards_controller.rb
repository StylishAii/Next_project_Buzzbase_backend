module Api
  module V1
    class AwardsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_user, only: [:create]

    def create
      award = Award.find_or_create_by(title: award_params[:title])
      unless @user.awards.include?(award)
        @user.awards << award
      end
      if @user.save
        render json: award, status: :create
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
    

    private

    def award_params
      params.require(:award).permit(:title)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    end
  end
end
