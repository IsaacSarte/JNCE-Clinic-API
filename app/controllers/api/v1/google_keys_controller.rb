class Api::V1::GoogleKeysController < ApplicationController
  def index
    @google_key = Rails.application.credentials.google_api_token[:token]
    render json: {
      data: {
        key: @google_key
      }
    }
  end
end
