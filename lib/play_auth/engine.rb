require "rails"

require "rubygems"
require "devise"
require "devise_invitable"
require "devise-encryptable"
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-openid'
require 'uuidtools'
require 'cancan'


module PlayAuth
  def self.root
    File.expand_path '../../..', __FILE__
  end

  class Engine < ::Rails::Engine
    isolate_namespace PlayAuth

    config.i18n.load_path += Dir[PlayAuth::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]


    def self.app_path
      File.expand_path '../../app', called_from
    end

    %w{controller helper model}.each do |resource|
      class_eval <<-RUBY
        def self.#{resource}_path(name)
          File.expand_path "#{resource.pluralize}/play_auth/\#{name}.rb", app_path
        end
      RUBY
    end
  end

end
