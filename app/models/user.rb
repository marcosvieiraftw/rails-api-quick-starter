class User < ApplicationRecord
  include AuthenticableEntity

  has_soft_deletion default_scope: true
  has_secure_password

  # Validations
  validates :name, length: { maximum: 60 }, presence: true, absence: false
  validates(
    :email,
    uniqueness: true,
    length: { maximum: 100 },
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true,
    absence: false
  )
end
