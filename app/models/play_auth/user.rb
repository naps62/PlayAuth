# author Naps62
module PlayAuth
  class User < ActiveRecord::Base

    #### Devise ####

    #include PlayAuth::Models::UserConcern
    devise  :database_authenticatable,
            :registerable,
            :encryptable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable

    devise  :encryptor => :sha1

    #### Associations ####
    has_many :authorizations, :dependent => :destroy

    # user N to N roles
    has_many :role_users
    has_many :roles, :through => :role_users

    attr_accessible :first_name,
                    :last_name,
                    :email,
                    :password,
                    :password_confirmation,
                    :remember_me,
                    :roles


    def display_name
      full_name = "#{first_name} #{last_name}".strip
      if full_name.size > 0
        full_name
      else
        email
      end
    end

    def admin?
      self.role.name == 'Admin'
    end

  end
end
