module PlayAuth
	module Models
		module PlayAuthAuthorizationData
			extend ActiveSupport::Concern

			included do
				# attr_accessible :title, :body
				belongs_to :user

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
	end
end