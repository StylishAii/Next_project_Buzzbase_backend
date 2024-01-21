module Api
  module V1
    class PlateAppearanceController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]
      before_action :set_plate_appearance, only: %i[update]

      def create
        plate_appearance = PlateAppearance.new(plate_appearance_params)
        if plate_appearance.save
          render json: plate_appearance, status: :created
        else
          render json: plate_appearance.errors, status: :unprocessable_entity
        end
      end

      def update
        if @plate_appearance.update(plate_appearance_params)
          render json: @plate_appearance
        else
          render json: @plate_appearance.errors, status: :unprocessable_entity
        end
      end

      private

      def set_plate_appearance
        @plate_appearance = PlateAppearance.find(params[:id])
      end

      def plate_appearance_params
        params.require(:plate_appearance).permit(:game_result_id, :user_id, :batter_box_number, :batting_result)
      end
    end
  end
end
