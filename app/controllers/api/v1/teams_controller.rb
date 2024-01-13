module Api
  module V1
    class TeamsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        @query = params[:query]
        @teams = Team.where('name LIKE ?', "%#{query}")
        render json: @teams
      end
    end
  end
end
