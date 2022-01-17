module Api
  module V1
    class StatesController < ApplicationController
      before_action :authenticate_user!
      
      def index
        @states = State.order('name ASC')
        json_response(@states.as_json(only: [:id, :name]))
      end
      
      private

      def state_params
        # whitelist params
        params.require(:state).permit(
          :name
        )
      end
      
    end
  end
end
