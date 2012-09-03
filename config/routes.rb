PlayAuth::Engine.routes.draw do
  
  devise_for  :users, 
          :controllers => { 
            :omniauth_callbacks => 'play_auth/users/omniauth_callbacks',
          }, 
          :class_name => 'PlayAuth::User',
          :module => :devise

  match '/profile' => 'users#profile', :as => 'profile'

  match '/admin' => 'admin/admin#index', :as => 'admin'
  
  match '/confirm/:confirmation_token',
      :to => 'devise/confirmations#show',
      :as => 'user_confirm', :only_path => false

  resources :users
  namespace :admin do
    resources :users
  end
end
