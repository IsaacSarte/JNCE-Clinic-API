class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authenticate_admin!, except: [:create]

  # GET /users
  def index
    @users = User.all.sort
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def edit; end

  # POST /users with public feedback
  def create
    @user = User.new(user_params)
    @feedback = @user.feedbacks.new
    @feedback.message = params[:message]

    if @user.save && @feedback.save
      # create_feedback(@user.id, params[:message])
      render json: { status: 201, message: 'Feedback was successfully sent.', data: { user: @user, feedback: @feedback } }, status: :created
    else
      render json: { status: 400, error: { user: @user.errors, feedback: @feedback.errors } }, status: :bad_request
    end
  end

  # POST /users with public appointment
  def appointment
    @user = User.new(user_params)
    @appointment = @user.appointments.new
    @appointment.schedule_date = params[:schedule_date]
    @appointment.status = 'On going'
    @appointment.service_id = params[:service_id]

    if @user.save && @appointment.save
      render json: { status: 201, message: 'Appointment was successfullly set.', data: { user: @user, feedback: @appointment } }, status: :created
    else
      render json: { status: 400, error: { user: @user.errors, appointment: @appointment.errors } }, status: :bad_request
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { status: 201, message: 'Feedback was successfully updated.', data: @user }, status: :created
    else
      render json: { status: 400, data: { message: @user.errors } }, status: :bad_request
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:fullname, :email, :phone)
  end
end
