require "rails"

require "rubygems"
require "devise"
require "devise_invitable"
require "devise-encryptable"
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-openid'
require 'uuidtools'
require 'will_paginate'
require 'cancan'

module PlayAuth
  def self.root
    File.expand_path '../../..', __FILE__
  end

  class Engine < ::Rails::Engine
    isolate_namespace PlayAuth

    config.i18n.load_path += Dir[PlayAuth::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
