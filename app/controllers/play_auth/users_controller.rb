#require_dependency "play_auth/application_controller"

module PlayAuth

  class UsersController < PlayAuth::ApplicationController
    load_and_authorize_resource :class => 'PlayAuth::User'

    def index
    end

    def show
      @user = PlayAuth::User.find params[:id]
      @providers = @user.authorizations.map(&:provider)
    end

    def profile
      @user = current_user
      @providers = @user.authorizations.map(&:provider)
      render :show
    end

  end
end
