module Api
  module V1
    class ListItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_list, only: [:index]
      before_action :set_list_item, only: [:update, :destroy]
      
      def index
        @list_items = @list.list_items.order('task ASC')
        json_response(@list_items)
      end
      
      def create
        @list_item = ListItem.create!(list_item_params)
        json_response(@list_item, :created)
      end
      
      def update
        @list_item.update(list_item_params)
        json_response(@list_item, 201)
      end
      
      def destroy
        @list_item.destroy
        json_response(@list_item, 200)
      end
      
      private
  
      def list_item_params
        # whitelist params
        params.require(:list_item).permit(
          :list_id, :task, :description, :status, :details, :start_date,
          :end_date
        )
      end
      
      def set_list
        @list = List.find(params[:list_id])
      end
      
      def set_list_item
        @list_item = ListItem.find(params[:id])
      end
      

      def current_user
        @current_user = User.find_by(id: params[:user_id])
      end
    end
  end
end
