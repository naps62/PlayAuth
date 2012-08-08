# author Naps62
module PlayAuth
    class User < ActiveRecord::Base

        #include PlayAuth::Models::UserConcern
        devise	:database_authenticatable,
         				:registerable,
         				:encryptable,
         				:recoverable,
         				:rememberable,
         				:trackable,
         				:validatable,
         				:omniauthable

    			devise  :encryptor => :sha1
    			# @!endgroup

    			attr_accessible	:name,
         							:email,
										:password,
										:password_confirmation,
										:remember_me

				has_many :authorizations, :dependent => :destroy
				#belongs_to :role

    end
end
