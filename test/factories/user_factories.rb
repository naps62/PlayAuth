Factory.define :user, :class => 'PlayAuth::User' do |f|
  f.first_name  'user_first_name'
  f.email       'user_email@email.com'
  f.password    'user_password'
  f.password    'user_password'

  # required if Devise Confirmable module is used
  f.confirmed_at Time.now
end