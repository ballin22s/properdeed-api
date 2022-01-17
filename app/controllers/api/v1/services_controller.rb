module Api
  module V1
    class ServicesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_service, only: [:show, :update, :destroy]
      
      def index
        @services = Service.order('name ASC')
        json_response(@services)
      end
      
      def create
        @service = Service.create!(service_params)
        json_response(@service, :created)
      end
      
      def show
        json_response(@vendor)
      end
      
      def update
        @service.update(service_params)
        head :no_content
      end
      
      def destroy
        @service.destroy
        head :no_content
      end
      
      private

      def service_params
        # whitelist params
        params.require(:service).permit(
          :name
        )
      end

      def set_service
        @service = Service.find(params[:id])
      end
      
    end
  end
end
