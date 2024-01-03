module Api
  module V1
    class PositionsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        @positions = Position.all
        render json: @positions
      end
    end
  end
end
