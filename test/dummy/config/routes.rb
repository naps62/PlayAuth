Rails.application.routes.draw do
	
	root :to => "users#index"

	mount PlayAuth::Engine => "/"

	resources :users
end
