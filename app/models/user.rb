class User < ActiveRecord::Base

	has_secure_password

	def self.confirm(params)
		@user = User.find_by({email_digest: params[:email_digest]})
		@user.try(:authenticate, params[:password])
	end
 

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/defaultavatar.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
 
end


