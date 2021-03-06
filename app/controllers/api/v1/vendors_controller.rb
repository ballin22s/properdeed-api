module Api
  module V1
    class VendorsController < ApplicationController
      before_action :authenticate_user!
      before_action :current_user
      before_action :set_vendor, only: [:show, :update, :destroy]
  
      # GET /vendors
      def index
        if params[:tag]
          @vendors = Vendor.includes(:vendor_address).tagged_with(params[:tag]).where(user_id: @current_user&.id)
        else
          @vendors = Vendor.includes(:vendor_address).where(user_id: @current_user&.id)
        end
        render json: @vendors, include: [vendor_address: {only: [:state_id, :city, :zip]}]
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
        json_response(@vendor, 201)
      end

      # DELETE /vendors/:id
      def destroy
        @vendor.destroy
        json_response(@vendor, 200)
      end

      private

      def vendor_params
        # whitelist params
        params.require(:vendor).permit(
          :user_id, :company_name, :first_name, :last_name, :phone,
          :email, :created_by, :all_services, :permalink, :website,
          :note,
          vendor_address_attributes: [ :id, :state_id, :city, :zip ]
        )
      end

      def set_vendor
        @vendor = Vendor.find(params[:id])
      end
      
      def current_user
        @current_user = User.find_by(id: params[:user_id])
      end
    end
  end
end
