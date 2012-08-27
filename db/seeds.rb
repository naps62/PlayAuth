puts 'Creating default Roles'

['Admin', 'User'].each do |role|
  PlayAuth::Role.find_or_create_by_name(role)
end

puts 'Creating initial admin user. Change password ASAP'

PlayAuth::User.create :first_name => 'Miguel',
                      :last_name  => 'Palhas',
                      :email      => 'mpalhas@gmail.com',
                      :password   => 'mpalhas',
                      :role       => PlayAuth::Role.find_by_name('Admin')


puts 'Creating regular user'

PlayAuth::User.create :first_name => 'Dummy62',
                      :last_name  => 'Dummy62',
                      :email      => 'dummy62@mail.com',
                      :password   => 'dummy62',
                      :role       => PlayAuth::Role.find_by_name('User')