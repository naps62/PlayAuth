Rails.application.routes.draw do
	root :to => "test#index"

	mount PlayAuth::Engine => "/"

	resources :users
end
