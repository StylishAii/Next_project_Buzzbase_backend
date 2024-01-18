module Api
  module V1
    class BaseballCategoriesController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        @categories = BaseballCategory.all
        render json: @categories
      end
    end
  end
end
