module Api
  module V1
    class PropertiesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_property, only: [:show, :update, :destroy]
      
      def create
        @property = Property.create!(property_params)
        json_response(@property, :created)
      end
      
      def destroy
        @property.destroy
        json_response(@list, 200)
      end
      
      private
      
      def property_params
        # whitelist params
        params.require(:property).permit(
          :user_id, :name, :multi_unit, :property_type
        )
      end
      
      def set_property
        @property = Property.find(params[:id])
      end

      def current_user
        @current_user = User.find_by(id: params[:user_id])
      end
    end
  end
end
