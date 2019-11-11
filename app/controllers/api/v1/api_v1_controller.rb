class Api::V1::ApiV1Controller < ApplicationController
  def policy_scope(scope)
    super([:api, :v1, scope])
  end

  def authorize(record, query = nil)
    super([:api, :v1, record], query)
  end
end
