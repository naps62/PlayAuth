#require 'generators/play_auth/model_helpers.rb'

module PlayAuth
	module Generators
		class InstallGenerator < Rails::Generators::Base

			#include PlayAuth::Generators::ModelHelpers

			source_root File.expand_path('../templates', __FILE__)

			desc 'Generates PlayAuth models inside host App'

			#
			# Actions
			#

			def template_initializers
				template 'play_auth.rb', 'config/initializers/play_auth.rb'
			end

			def create_models
				directory 'models', 'app/models/play_auth'
			end

			#def create_controllers
			#	directory 'controllers', 'app/controllers/play_auth'
			#end

			def inject_routes
				inject_into_file	'config/routes.rb',
										"\n\tmount Blogcms::Engine => '/'",
										:after => "Rails.application.routes.draw do\n"
			end
		end
	end
end
