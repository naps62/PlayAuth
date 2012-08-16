$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "play_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "play_auth"
  s.version     = PlayAuth::VERSION
  s.authors     = ["Miguel Palhas"]
  s.email       = ["mpalhas@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Handling of user management and user authentication for the UPlay system"
  s.description = "UPlay user management engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.7"

  s.add_dependency "devise",             ">= 2.0.4"
  s.add_dependency "devise-encryptable", ">= 0.1.1"
  s.add_dependency "devise_invitable",   ">= 1.0.0"
  s.add_dependency "omniauth",           "~> 1.0.2"
  s.add_dependency "omniauth-facebook",  "~> 1.2.0"
  s.add_dependency "omniauth-openid",    "~> 1.0.1"
  s.add_dependency "uuidtools",          ">= 2.1.2"
  s.add_dependency "will_paginate",      ">= 3.0.3"
  s.add_dependency "cancan",             ">= 1.6.7"

  s.add_development_dependency "sqlite3"
end
