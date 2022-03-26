class Api::V1::FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: [:create]

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all
    @feedbacks = @feedbacks.where(user_id: params[:user_id]) if params[:user_id]
    render json: @feedbacks
  end

  # GET /feedbacks/1
  def show
    if @feedback.empty?
      render json: {
        status: 400,
        message: 'feedback record your trying to access for this user was not found'
      }, status: :bad_request
    else
      render json: @feedback
    end
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit; end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      render json: { status: 201, message: 'feedback message was successfully send', data: @feedback }, status: :created
    else
      render json: { status: 400, data: { message: @feedback.errors } }, status: :bad_request
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      render json: { status: 201, message: 'feedback message was successfully updated', data: @feedback }, status: :created
    else
      render json: { status: 400, data: { message: @feedback.errors } }, status: :bad_request
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.where(id: params[:id]).and(Feedback.where(user_id: params[:user_id]))
  end

  # Only allow a list of trusted parameters through.
  def feedback_params
    params.require(:feedback).permit(:user_id, :message)
  end
end
