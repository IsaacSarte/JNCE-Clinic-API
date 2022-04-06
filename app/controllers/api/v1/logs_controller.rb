class Api::V1::LogsController < ApplicationController
  before_action :set_log, only: [:show]
  before_action :authenticate_admin!, except: [:create]

  # GET /logs
  def index
    @logs = Log.all.sort
    render json: @logs, status: :ok
  end

  # GET /logs/1
  def show
    render json: @log
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: { status: 201, message: 'Logs created', data: { log:  @log } }, status: :created
    else
      render json: { status: 400, error: { log: @log.errors } }, status: :bad_request
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def log_params
    params.require(:log).permit(:message, :appointment_id, :admin_id)
  end
end
