class Api::V1::ServicesController < ApplicationController
  before_action :set_service, only: %i[show]

  def index
    @services = Service.all.sort
    render json: @services
  end

  def show; end

  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:service).permit(:name)
  end
end
