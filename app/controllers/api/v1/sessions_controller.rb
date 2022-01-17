module Api
  module V1
    class SessionsController < Devise::SessionsController
      
      def create
        user = User.find_by_email(params[:sessions][:email])

        if user && user.valid_password?(params[:sessions][:password])
          @current_user = user
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end
        
    end
  end
end