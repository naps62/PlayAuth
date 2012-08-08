# author Naps62
class PlayAuth::HomeController < PlayAuth::ApplicationController
  #authorize_resource :class => false
  
  def index
    @users = PlayAuth::User.all
  end
end
