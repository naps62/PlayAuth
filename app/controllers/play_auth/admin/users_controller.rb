class PlayAuth::Admin::UsersController < PlayAuth::Admin::ApplicationController

  def index
    @users = PlayAuth::User.all
  end

  def show
    @user = PlayAuth::User.find params[:id]
    @providers = @user.authorizations.map(&:provider)

    render 'play_auth/users/show'
  end

  def edit
    @user = PlayAuth::User.find params[:id]
  end

  def destroy
    PlayAuth::User.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
end