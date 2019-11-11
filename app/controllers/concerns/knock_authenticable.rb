module KnockAuthenticable
  extend ActiveSupport::Concern
  include Knock::Authenticable

  included do
    before_action :authenticate_user
  end

  private

  def unauthorized_entity(*)
    token_invalid
  end

  def token_invalid
    render json: { errors: [I18n.t('authentication.default.token_invalid')] }, status: :unauthorized
  end
end
