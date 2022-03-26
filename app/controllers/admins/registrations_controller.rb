# frozen_string_literal: trues

class Admins::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'admin successfully added.' }, status: :created
  end

  def register_failed
    render json: { data: { message: resource.errors } }, status: :bad_request
  end
end
