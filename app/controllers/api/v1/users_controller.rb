class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users
  def index
    @users = User.all.sort
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 201, message: 'feedback was successfully send', data: @user }, status: 201
    else
      render json: { status: 400, data: { message: @user.errors } }, status: 400
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { status: 201, message: 'feedback was successfully updated', data: @user }, status: 201
    else
      render json: { status: 400, data: { message: @user.errors } }, status: 400
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
