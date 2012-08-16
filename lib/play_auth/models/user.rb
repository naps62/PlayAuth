module PlayAuth
	module Models
		module UserConcern
			extend ActiveSupport::Concern

			included do
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
	end
end