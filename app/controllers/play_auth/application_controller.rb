class PlayAuth::ApplicationController < ::ApplicationController
		
		def resource_name
			:user
		end

		def resource
			@resource ||= PlayAuth::User.new
		end

		def devise_mapping
			@devise_mapping ||= Devise.mappings[:user]
		end

		def current_ability
			PlayAuth::Ability.new(current_user)
		end

	end
