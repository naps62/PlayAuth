PlayAuth::Engine.routes.draw do
	
	devise_for	:users, 
					:controllers => { 
						:omniauth_callbacks => "play_auth/users/omniauth_callbacks",
					}, 
					:class_name => "PlayAuth::User",
					:module => :devise
  
	match	'/confirm/:confirmation_token',
			:to => "devise/confirmations#show",
			:as => "user_confirm", :only_path => false
end
