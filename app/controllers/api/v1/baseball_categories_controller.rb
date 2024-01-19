module Api
  module V1
    class BaseballCategoriesController < ApplicationController
      def index
        @categories = BaseballCategory.all
        render json: @categories
      end
    end
  end
end
