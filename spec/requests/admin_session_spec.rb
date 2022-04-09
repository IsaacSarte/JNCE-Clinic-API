require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /admins/sign_in' do
    it 'has status of 200' do
      admin = create(:admin, email: 'admin@email.com', password: 'password', name: 'name')
      post '/admins/sign_in', params: { admin: { email: admin.email, password: 'password' } }

      expect(response).to have_http_status(:ok)
    end

    it 'returns an admin' do
      admin = create(:admin, email: 'admin@email.com', password: 'password', name: 'name')
      post '/admins/sign_in', params: { admin: { email: admin.email, password: 'password' } }

      res_json = JSON.parse(response.body)
      expect(res_json['data']).to include('email')
      #   expect(res_json['data']).to include('id')
      #   expect(res_json['data']['email']).to eq(admin.email)
    end
  end
end
