module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      
      def create
        @user = User.new(sign_up_params)
        if @user.save
          @current_user = @user
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end
      
      private
      
      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

    end
  end
end