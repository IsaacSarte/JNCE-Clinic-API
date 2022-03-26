module Api
  module V1
    class Admins::RegistrationsController < Devise::RegistrationsController
      respond_to :json

      private

      def respond_with(resource, _opts = {})
        resource.persisted? ? register_success : register_failed
      end

      def register_success
        render json: { message: 'Admin successfully added.' }, status: :created
      end

      def register_failed
        render json: { message: 'Signed up failure.' }, status: :unauthorized
      end
    end
  end
end
