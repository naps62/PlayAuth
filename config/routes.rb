PlayAuth::Engine.routes.draw do

	root :to => 'home#index'
	
	devise_for	:users, 
					:controllers => { 
						:omniauth_callbacks => "play_auth/users/omniauth_callbacks",
					}, 
					:class_name => "PlayAuth::User",
					:module => :devise

	match "/user/profile" => "users#show",
			:as => "profile"
  
	match	'/confirm/:confirmation_token',
			:to => "devise/confirmations#show",
			:as => "user_confirm", :only_path => false
end
