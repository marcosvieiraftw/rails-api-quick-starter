class ApplicationController < ActionController::API
  wrap_parameters false

  include KnockAuthenticable
  include PunditAuthorizable
  include Pagy::Backend
end
