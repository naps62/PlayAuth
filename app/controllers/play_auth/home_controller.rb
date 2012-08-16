class HomeController < ApplicationController

	def index
		@users = PlayAuth::User.all
	end
end
