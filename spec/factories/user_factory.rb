Factory.define :user, :class => 'PlayAuth::User' do |f|
  f.first_name  'user_first_name'
  f.email       'user_email@email.com'
  f.password    'user_password'
  f.password    'user_password'

  # required if Devise Confirmable module is used
  f.confirmed_at Time.now
  foo.roles = [PlayAuth::Role.find_by_name('User')]

  Factory.define :admin do
    foo.roles = [PlayAuth::Role.find_by_name('Admin')]
  end
  
end