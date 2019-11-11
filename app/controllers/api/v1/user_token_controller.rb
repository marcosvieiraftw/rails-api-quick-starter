class Api::V1::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  def create
    render(
      json: {
        jwt_token: auth_token.token,
        user: Api::V1::UserSerializer.new(entity).serializable_hash,
      },
      status: :created
    )
  end
end
