PlayAuth::Engine.routes.draw do

	#devise_for :users, :class_name => "PlayAuth::User"
	root :to => "home#index"

	match "/user/profile" => "users#show", :as => "profile"
  
	match '/confirm/:confirmation_token', :to => "devise/confirmations#show", :as => "user_confirm", :only_path => false

	devise_for	:users, 
					:controllers => { 
						:omniauth_callbacks => "play_auth/users/omniauth_callbacks",
						:sessions => "play_auth/users/omniauth_sessions"
					}, 
					:class_name => "PlayAuth::User",
					:module => :devise

end
