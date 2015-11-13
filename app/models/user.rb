class User < ActiveRecord::Base

	has_secure_password

	def self.confirm(params)
		@user = User.find_by({email_digest: params[:email_digest]})
		@user.try(:authenticate, params[:password])
	end
end
