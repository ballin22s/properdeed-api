module Api
  module V1
    class PropertiesController < ApplicationController
      before_action :authenticate_user!
      before_action :current_user
      before_action :set_property, only: [:show, :update, :destroy]
      
      def index
        @properties = Property.includes(:property_address).where(user_id: @current_user&.id)
        render json: @properties, include: [property_address: {only: [:street1, :street2, :state_id, :city, :zip]}]
      end

      def create
        @property = Property.create!(property_params)
        json_response(@property, :created)
      end
      
      def update
        @property.update(property_params)
        json_response(@property, 201)
      end
      
      def destroy
        @property.destroy
        json_response(@list, 200)
      end
      
      private
      
      def property_params
        # whitelist params
        params.require(:property).permit(
          :user_id, :name, :multi_unit, :property_type, :investment_type,
          property_address_attributes: [ :id, :street1, :street2, :state_id, :city, :zip ]
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
