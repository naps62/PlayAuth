Rails.application.routes.draw do
	
	root :to => "play_auth/users#index"

	mount PlayAuth::Engine => "/"
end
