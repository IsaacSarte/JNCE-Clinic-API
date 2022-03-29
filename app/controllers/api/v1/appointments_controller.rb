class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show]
  before_action :authenticate_admin!

  # GET /appointments
  def index
    @appointments = Appointment.where(user_id: params[:user_id]).sort
    render json: @appointments, status: :ok
  end

  # GET /appointments/1
  def show
    if @appointment.empty?
      render json: {
        status: 400,
        message: 'Appointment record your trying to access for this user was not found.'
      }, status: :bad_request
    else
      render json: @appointment
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.where(id: params[:id]).and(Appointment.where(user_id: params[:user_id]))
  end
end
