PlayAuth::Engine.routes.draw do

	#devise_for :users, :class_name => "PlayAuth::User"
	root :to => "home#index"

	match "/user/profile" => "users#show", :as => "profile"
  
	match '/confirm/:confirmation_token', :to => "devise/confirmations#show", :as => "user_confirm", :only_path => false

	devise_for	:users, 
					:controllers => { 
						:omniauth_callbacks => "play_auth/users/omniauth_callbacks",
						#:sessions => "play_auth/users/omniauth_sessions"
					}, 
					:class_name => "PlayAuth::User",
					:module => :devise#,
					#:skip => [:sessions]

	devise_scope :user do
		match '/users/signin/facebook', :to => 'users/omniauth_callbacks#facebook'
	end

	#as :user do
	#	get 'signin'     => 'devise/sessions#new',     :as => :new_user_session
	#	post 'signin'    => 'devise/sessions#create',  :as => :user_session
	#	delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
	#end

	#devise_scope :user do
	#	get "/login" => "devise/sessions#new"
	#end

end
