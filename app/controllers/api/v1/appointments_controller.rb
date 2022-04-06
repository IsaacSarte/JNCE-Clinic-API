class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update]
  before_action :authenticate_admin!, except: %i[create update]

  # GET /appointments
  def index
    @appointments = Appointment.all.sort
    render json: @appointments, status: :ok
  end

  # GET /appointments/1
  def show
    if @appointment.empty?
      render json: {
        status: 400,
        message: 'Appointment record your trying to access was not found.'
      }, status: :bad_request
    else
      render json: @appointment
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: { status: 201, message: 'You are successfully scheduled.', data: { appointment: @appointment } }, status: :created
    else
      render json: { status: 400, error: { appointment: @appointment.errors } }, status: :bad_request
    end
  end

  def update
    if @appointment.update(appointment_params)
      AppointmentMailer.status_changed(@appointment.email).deliver_now
      render json: { status: 201, message: 'Appointment was successfully updated.', data: @appointment }, status: :created
    else
      render json: { status: 400, data: { message: @appointment.errors } }, status: :bad_request
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.where(id: params[:id]).first
  end

  def appointment_params
    params.require(:appointment).permit(:fullname, :email, :title, :location, :start_datetime, :end_datetime, :status, :service_id)
  end
end
