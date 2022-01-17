module Api
  module V1
    class VendorsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_vendor, only: [:show, :update, :destroy]
  
      # GET /vendors
      def index
        if params[:tag]
          @vendors = Vendor.tagged_with(params[:tag])
        else
          @vendors = Vendor.includes(:vendor_addresses)
        end
        render json: @vendors, include: [vendor_addresses: {only: [:state_id, :city, :zip]}]
      end

      # POST /vendors
      def create
        @vendor = Vendor.create!(vendor_params)
        json_response(@vendor, :created)
      end

      # GET /vendors/:id
      def show
        json_response(@vendor)
      end

      # PUT /vendors/:id
      def update
        @vendor.update(vendor_params)
        head :no_content
      end

      # DELETE /vendors/:id
      def destroy
        @vendor.destroy
        head :no_content
      end

      private

      def vendor_params
        # whitelist params
        params.require(:vendor).permit(
          :user_id, :company_name, :first_name, :last_name, :phone,
          :email, :created_by, :all_services,
          vendor_addresses_attributes: [ :id, :state_id, :city, :zip ]
        )
      end

      def set_vendor
        @vendor = Vendor.find(params[:id])
      end
    end
  end
end
