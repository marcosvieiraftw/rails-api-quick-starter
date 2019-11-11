require 'rails_helper'

RSpec.describe('Api::V1::Authentication', type: :request) do
  let(:user) { create(:user, password: '123456') }

  describe 'POST /login' do
    context 'with valid credentials' do
      it 'Login should be accepted' do
        post api_v1_login_path, params: { auth: { email: user.email, password: '123456' } }
        expect(response).to(have_http_status(201))
      end
    end

    context 'with invalid credentials' do
      it 'Login should not be accepted' do
        post api_v1_login_path, params: { auth: { email: 'non_existent_user@neu.com', password: 'invalid_password' } }
        expect(response).to(have_http_status(404))
      end
    end
  end

  describe 'GET /users' do
    context 'without JWT token' do
      it 'should be rejected' do
        get api_v1_users_path
        rsp_error = json_response[:errors].first
        error_message = I18n.t('authentication.default.token_invalid')
        expect(response).to(have_http_status(401))
        expect(rsp_error).to(eq(error_message))
      end
    end

    context 'with valid JWT token' do
      it 'should be accepted and return a success http code' do
        get api_v1_users_path, headers: authenticated_header(user)
        expect(response).to(have_http_status(200))
      end
    end
  end
end
