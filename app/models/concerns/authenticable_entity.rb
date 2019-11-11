module AuthenticableEntity
  extend ActiveSupport::Concern

  def to_token_payload
    { sub: id, class: self.class.to_s }
  end

  def self.from_token_payload(payload)
    find(payload['sub']) if payload['class'] && payload['class'] == to_s
  end
end
