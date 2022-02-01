module Api
  module V1
    class SupportsController < ApplicationController
      
      def create
        @support = Support.create(support_params)
        #json_response(@support, :created)
        if @support.save
          redirect_to help_path
        else
          redirect_to help_path
        end
      end
  
      private
  
      def support_params
        params.require(:support).permit(:name, :email, :reason, :message)
      end
    end
  end
end
