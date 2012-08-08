# author Naps62
module PlayAuth
	class Authorization < ActiveRecord::Base
		
		include PlayAuth::Models::AuthorizationConcern

	end
end