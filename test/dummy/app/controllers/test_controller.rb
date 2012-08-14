class TestController < ApplicationController

	def index
		@users = PlayAuth::User.all
	end
end
