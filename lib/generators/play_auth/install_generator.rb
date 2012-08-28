#require 'generators/play_auth/model_helpers.rb'

module PlayAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      #
      # Actions
      #

      def template_initializers
        template 'initializer.rb', 'config/initializers/play_auth.rb'
      end

      def inject_seeds
        append_file "db/seeds.rb", "PlayAuth::Engine.load_seed\n"
      end

      def inject_routes
        inject_into_file  'config/routes.rb',
                    "\n\tmount PlayAuth::Engine => '/'",
                    :after => "Rails.application.routes.draw do\n"
      end
    end
  end
end
