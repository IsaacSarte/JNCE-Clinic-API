class Api::V1::FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show update]
  # before_action :authenticate_admin!

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all
    @feedbacks = @feedbacks.where(user_id: params[:user_id]) if params[:user_id]
    render json: @feedbacks, status: :ok
  end

  # GET /feedbacks/1
  def show
    if @feedback.empty?
      render json: {
        status: 400,
        message: 'Feedback record your trying to access for this user was not found.'
      }, status: :bad_request
    else
      render json: @feedback
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      render json: { status: 201, message: 'Feedback message was successfully updated.', data: @feedback }, status: :created
    else
      render json: { status: 400, data: { message: @feedback.errors } }, status: :bad_request
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.where(id: params[:id]).and(Feedback.where(user_id: params[:user_id]))
  end
end
