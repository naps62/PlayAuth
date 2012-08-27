require_dependency "play_auth/application_controller"


class PlayAuth::UsersController < PlayAuth::ApplicationController
  load_and_authorize_resource :class => 'PlayAuth::User'

  def show
    #@user = current_user
    @providers = @user.authorizations.map(&:provider)
  end

end
