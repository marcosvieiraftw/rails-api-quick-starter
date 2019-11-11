module Helpers
  def authenticated_header(entity)
    token = Knock::AuthToken.new(payload: entity.to_token_payload).token
    { Authorization: "Bearer #{token}" }
  end
end
