class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :params_not_found
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def record_not_found
    render json: { status: 404, data: { error: 'Record your trying to access was not found.' } }, status: :not_found
  end

  def params_not_found
    render json: { status: 400, data: { error: 'Please kindly fill out all required fields.' } }, status: :bad_request
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
