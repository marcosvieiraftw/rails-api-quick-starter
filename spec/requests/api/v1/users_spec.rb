require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:user) { create(:user, name: 'fresh_user', password: '123') }

  describe 'GET /api/v1/users' do
    context 'when user has permission to access resource' do
      before do
        create_list(:user, 3)
        get api_v1_users_path, headers: authenticated_header(user)
      end

      it 'returns user list' do
        expect(json_response[:data].count).to(eq(4))
      end

      it 'get users and return correct http status' do
        expect(response).to(have_http_status(200))
      end

      it 'returns content list with pagination metadata' do
        expect(json_response[:meta].present?).to(be(true))
      end
    end
  end

  describe 'GET /api/v1/users/:id' do
    context 'when user has permission to access resource' do
      before do
        get "/api/v1/users/#{user.id}", headers: authenticated_header(user)
      end

      it 'get user and return correct http status' do
        expect(response).to(have_http_status(200))
      end

      it 'returns user from param id data' do
        expect(json_response[:data][:attributes][:name]).to(eq(user.name))
      end
    end
  end

  describe 'POST /api/v1/users' do
    context 'when user has permission to access resource' do
      before do
        body = {
          api_v1_user: {
            name: 'Marcos',
            email: 'marcos@m.com',
            password: '123',
            password_confirmation: '123',
          },
        }
        post api_v1_users_path, headers: authenticated_header(user), params: body
      end

      it 'creates user and return correct http status' do
        expect(response).to(have_http_status(201))
      end

      it 'returns fresh created user from post' do
        expect(json_response[:data][:attributes][:name]).to(eq('Marcos'))
        expect(json_response[:data][:attributes][:email]).to(eq('marcos@m.com'))
      end
    end
  end

  describe 'PUT /api/v1/users/:id' do
    context 'when user has permission to access resource' do
      before do
        body = {
          api_v1_user: {
            name: 'New fresh name',
            email: 'new@m.com',
          },
        }
        put "/api/v1/users/#{user.id}", headers: authenticated_header(user), params: body
      end

      it 'updates user and return correct http status' do
        expect(response).to(have_http_status(200))
      end

      it 'returns user updated from post' do
        expect(json_response[:data][:attributes][:name]).to(eq('New fresh name'))
        expect(json_response[:data][:attributes][:email]).to(eq('new@m.com'))
        expect(json_response[:data][:attributes][:name]).not_to(eq('fresh_user'))
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    context 'when user has permission to access resource' do
      before do
        delete "/api/v1/users/#{user.id}", headers: authenticated_header(user)
      end

      it 'deletes user and return correct http status' do
        expect(response).to(have_http_status(204))
      end

      it 'user`s deleted_at field is not nil' do
        user.reload
        expect(user.deleted_at).not_to(be_nil)
      end
    end
  end
end
