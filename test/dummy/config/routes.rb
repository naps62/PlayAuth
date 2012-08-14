Rails.application.routes.draw do
	root :to => "test#index"

	mount PlayAuth::Engine => "/"
end
