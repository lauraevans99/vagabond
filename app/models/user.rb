class User < ActiveRecord::Base

	has_secure_password

	validates :password, confirmation: true
	validates :password_confirmation, presence: true
	# validates_confirmation_of :password

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
