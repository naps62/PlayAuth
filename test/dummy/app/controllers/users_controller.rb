class UsersController < ApplicationController

	def index
		@users = PlayAuth::User.all
	end

	def show
		@user = PlayAuth::User.find_by_id(params[:id])
	end
end
