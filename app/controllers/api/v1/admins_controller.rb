class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only: %i[show update]
  # before_action :authenticate_admin!

  def index; end

  def show
    render json: @admin
  end

  def update
    if @admin.update(admin_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@admin)
      render json: { status: 201, message: 'Admin account successfully updated.', data: @admin }, status: :created
    else
      render json: { status: 400, data: { message: @admin.errors } }, status: :bad_request
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :name)
  end
end
