# author Naps62
module PlayAuth
	class Authorization < ActiveRecord::Base
		
		#include PlayAuth::Models::AuthorizationConcern

				belongs_to :user, :class_name => 'PlayAuth::User'

				attr_accessible	:provider,
										:uid,
										:user_id,
										:email,
										:token,
										:name,
										:link,
										:image_url

	end
end