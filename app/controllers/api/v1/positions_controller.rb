module Api
  module V1
    class PositionsController < ApplicationController
      def index
        @positions = Position.all
        render json: @positions
      end
    end
  end
end
