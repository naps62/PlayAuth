PlayAuth::Engine.load_seed

user = PlayAuth::User.create  :email        => 'mpalhas@gmail.com',
                    :first_name   => 'Miguel',
                    :last_name    => 'Palhas',
                    :password     => 'mpalhas',
                    :confirmed_at => Time.now

user.roles << PlayAuth::Role.find_by_name('Admin')