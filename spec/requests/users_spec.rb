require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let(:headers) { valid_headers }

  describe 'GET /users' do
    let(:valid_attributes) do
      { user: { name: 'Masud', email: 'test@example.com', password: '11111111', password_confirmation: '11111111' }}
    end
    before { post '/users', params: valid_attributes }

    it 'create user' do
      expect(json).not_to be_empty
    end

    it 'returns user create success message' do
      expect(json['status']).to eq('User created successfully')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end