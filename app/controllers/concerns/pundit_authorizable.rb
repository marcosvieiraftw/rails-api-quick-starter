module PunditAuthorizable
  extend ActiveSupport::Concern
  include Pundit

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    render json: { data: { errors: [I18n.t('authorization.default.unauthorized')] } }, status: :forbidden
  end
end
