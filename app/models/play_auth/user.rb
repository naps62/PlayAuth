# author Naps62
module PlayAuth
  class User < ActiveRecord::Base

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

    attr_accessible :first_name,
                    :last_name,
                    :email,
                    :password,
                    :password_confirmation,
                    :remember_me,
                    :role

    has_many :authorizations, :dependent => :destroy
    belongs_to :role

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
