module JsonHelper
  def json_response
    response.body.blank? ? response : JSON.parse(response.body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include(JsonHelper, type: :request)
end
