# @autor Naps62
class PlayAuth::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	# auth for facebook
	def facebook
		oauthorize 'Facebook'
	end

	# auth for google
	def google
		oauthorize 'Google'
	end

	def passthru
		render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	end

	# auth (generic)
	# find user that matches oauth request
	def oauthorize(kind)
		current_user ||= (params[:user]) ? PlayAuth::User.find(params[:user]) : nil
		@user = find_for_oauth(kind, request.env['omniauth.auth'], current_user)

		flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => kind

		# TODO this is probably not necessary. only uid/email should be necessary to identify user. All the rest is already on DB
		session["devise.#{kind.downcase}_data"] = request.env['omniauth.auth']

		if @user.persisted?	
			#sign_in_and_redirect @user, :event => :auth
			sign_in @user, :event => :auth
		else
			#sign_in_and_redirect @user, :event => :first_auth
			sign_in @user, :event => :first_auth
		end

		# TODO this should be updated to a smarter redirect
		redirect_to main_app.root_path

	end

	#
	# private methods
	#
	private

		def find_for_oauth(provider, token, resource = nil)
			auth_data = get_auth_data(provider, token)

			# get the user associated with this auth_data, either by email or by uid
			if resource.nil?

				# try to find registered user, either by email or by uid
				if auth_data[:email]
					user = find_for_oauth_by_email(auth_data[:email])
				elsif auth_data[:uid]
					user = find_for_oauth_by_uid(auth_data[:uid])
				end

			else

				# if no matching user is registered, current resource is used
				# (might be an unpersisted User.new)
				user = resource
			end

			# persist the user unless it already is
			unless user.persisted?
				user.save
			end

			# get the identity used by the user to sign_in
			auths = user.authorizations

			if !auths.nil?
				auth = auths.find_by_provider_and_uid(provider, auth_data[:uid])
			end

			# if no identity is found, it is built
			if auth.nil?
				auth = user.authorizations.build(:provider => provider, :uid => auth_data[:uid])
			end
			auth.update_attributes auth_data

			return user
		end

		# auth data independent from provider
		def get_auth_data(provider, token)
			case provider
				when 'Facebook'
					return {
						:uid      	=> token['uid'],
						:token    	=> token['extra']['raw_info']['token'],
						:email    	=> token['extra']['raw_info']['email'],
						:name     	=> token['extra']['raw_info']['name'],
						:link     	=> token['extra']['raw_info']['link'],
						:image_url	=> token['image']
					}

				when 'Google'
					return {
						:uid    => token['uid'],
						:token  => token['credentials']['token'],
						:email  => token['info']['email'],
						:name   => token['info']['name']
					}
				else
					raise "Provider #{provider} not handled"
			end
		end

		def find_for_oauth_by_uid(uid)
			user = nil
			if auth = PlayAuth::Authorization.find_by_uid(uid.to_s)
				user = auth.user
			end
			return user
		end

		def find_for_oauth_by_email(email)
			if user = PlayAuth::User.find_by_email(email)
				user
			else
				user = PlayAuth::User.new :email => email, :password => Devise.friendly_token[0,20]
			end
		end

end
