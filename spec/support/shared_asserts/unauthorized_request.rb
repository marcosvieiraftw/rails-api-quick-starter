RSpec.shared_examples 'unauthorized request' do
  it "responds with 'unauthorized http status'" do
    expect(response).to(have_http_status(:unauthorized))
  end
end
