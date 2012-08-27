class PlayAuth::Admin::ApplicationController < PlayAuth::ApplicationController
  protect_from_forgery

  def current_ability
    PlayAuth::Ability.new(current_user)
  end
end