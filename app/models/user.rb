class User < ActiveRecord::Base

	has_secure_password

	# validates :password, confirmation: true
	#validates :password_confirmation, presence: true
	# validates_confirmation_of :password

	def self.confirm(params)
		@user = User.find_by({email_digest: params[:email_digest]})
		@user.try(:authenticate, params[:password])
	end
end
