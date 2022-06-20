module Api
  module V1
    class ListsController < ApplicationController
      before_action :authenticate_user!
      
      def index
        @lists = List.order('name ASC')
        json_response(@lists)
      end
      
      def create
        @list = List.create!(list_params)
        json_response(@list, :created)
      end
      
      def show
        json_response(@list)
      end
      
      def update
        @list.update(list_params)
        json_response(@list, 201)
      end
      
      def destroy
        @list.destroy
        json_response(@list, 200)
      end
      
      private
      def list_params
        # whitelist params
        params.require(:list).permit(
          :property_id, :name
        )
      end

      def current_user
        @current_user = User.find_by(id: params[:user_id])
      end
    end
  end
end
