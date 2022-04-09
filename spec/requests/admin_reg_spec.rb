require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /admins' do
    it 'registers' do
      post '/admins/', params: { admin: {
        email: 'admin@email.com',
         password: 'password', name: 'name'
      } }

      expect(response).to have_http_status(:created)
      #   expect(response.headers['Authorization']).to include('Bearer')
    end
  end
end
