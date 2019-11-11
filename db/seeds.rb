# Seeds
User.where(email: 'marcos@marcos.com').first_or_create!(
  name: 'marcos',
  email: 'marcos@marcos.com',
  password: '123',
  password_confirmation: '123'
)
