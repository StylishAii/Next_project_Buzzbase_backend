module Api
  module V1
    class PrefecturesController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        @prefecture = Prefecture.all
        render json: @prefecture
      end
    end
  end
end
