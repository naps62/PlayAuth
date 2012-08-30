
module PlayAuth
  puts 'Creating default Roles'

  ['Admin', 'User'].each do |role|
    Role.find_or_create_by_name(role)
  end

  puts 'Creating initial admin user. Change password ASAP'

  user = User.create  :email      => 'mpalhas@gmail.com',
                      :first_name => 'Miguel',
                      :last_name  => 'Palhas',
                      :password   => 'mpalhas'

  #user.roles << Role.find_by_name('Admin')


  puts 'Creating regular user'

  user = User.create :email      => 'dummy62@mail.com',
                     :first_name => 'Dummy62',
                     :last_name  => 'Dummy62',
                     :password   => 'dummy62'

  #user.roles << Role.find_by_name('User')
end