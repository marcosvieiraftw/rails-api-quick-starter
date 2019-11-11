RSpec.shared_examples 'forbidden request' do
  it "responds with 'forbidden http status'" do
    expect(response).to(have_http_status(:forbidden))
  end
end
