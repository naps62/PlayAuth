source 'http://rubygems.org'

# Declare your gem's dependencies in play_auth.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'
gem 'devise'#, :git => "git://github.com/plataformatec/devise.git"
gem 'haml'
gem 'factory_girl'

group :development do
	gem 'awesome_print', :require => 'ap'

	# To use debugger
	gem 'execjs'
	gem 'therubyracer'
	gem 'debugger'
end

group :test do
	gem 'cucumber-rails'#, :require => false
	gem 'database_cleaner'
end

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

