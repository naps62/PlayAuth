require 'play_auth/engine'

module PlayAuth
	Dir["#{PlayAuth.root}/lib/*.rb"].each {|file| require file}
	Dir["#{PlayAuth.root}/lib/play_auth/models/*.rb"].each {|file| require file}
end
