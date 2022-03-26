module Api
  module V1
    class Admins::SessionsController < Devise::SessionsController
      respond_to :json

      private

      def respond_with(_resource, _opts = {})
        if current_admin
          # render json: { message: 'Logged in successful' }, status: :ok
          render json: {
            status: { status: 200, message: 'Logged in sucessfully.' },
            data: current_admin
          }, status: :ok
        else
          render json: { status: 401, message: 'you need to sign up before continuing' }, status: :unauthorized
        end
      end

      def respond_to_on_destroy
        current_admin ? log_out_success : log_out_failure
      end

      def log_out_success
        render json: { status: 200, message: 'Logged out.' }, status: :ok
      end

      def log_out_failure
        render json: { status: 401, message: 'Logged out failure.' }, status: :unauthorized
      end
    end
  end
end
