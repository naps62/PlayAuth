class PlayAuth::Admin::AdminController < PlayAuth::Admin::ApplicationController
  authorize_resource :class => 'PlayAuth::User'

  def index
  end
  
end