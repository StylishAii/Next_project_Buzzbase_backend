module Api
  module V1
    class PrefecturesController < ApplicationController

      def index
        @prefecture = Prefecture.all
        render json: @prefecture
      end
    end
  end
end
