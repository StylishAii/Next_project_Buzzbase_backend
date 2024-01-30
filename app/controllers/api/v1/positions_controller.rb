module Api
  module V1
    class PositionsController < ApplicationController
      before_action :set_position, only: %i[show]

      def index
        @positions = Position.all
        render json: @positions
      end

      def show
        if @positon
          render json: { name: @positon.name }
        else
          render json: { error: 'ポジションが見つかりません。' }, status: :not_found
        end
      end

      private

      def set_position
        @positon = Position.find(params[:id])
      end
    end
  end
end
