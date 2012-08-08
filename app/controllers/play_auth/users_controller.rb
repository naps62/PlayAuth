# author Naps62
class PlayAuth::UsersController < PlayAuth::ApplicationController
  #load_and_authorize_resource :class => "PlayAuth::User"

  def show
    @providers = PlayAuth::User.omniauth_providers
  end
end
