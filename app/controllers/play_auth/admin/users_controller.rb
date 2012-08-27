class PlayAuth::Admin::UsersController < PlayAuth::Admin::ApplicationController

  def index
    @users = PlayAuth::User.all
  end

  def show
    @users = PlayAuth::User.all
  end

  def edit
    @user = PlayAuth::User.find params[:id]
  end

  def destroy
    PlayAuth::User.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
end