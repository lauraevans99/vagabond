class User < ActiveRecord::Base

	has_secure_password

	validates :alias, :email_digest, presence: true
	validates :email_digest, uniqueness: true
	validates :password, length: { in: 6..20 }
	validates :password, confirmation: true

	def self.confirm(params)
		@user = User.find_by({email_digest: params[:email_digest]})
		@user.try(:authenticate, params[:password])
	end
 

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.picturesof.net/_images_300/A_Man_with_a_Scruffy_Beard_and_Worn_Hat_Wearing_a_Pipe_Royalty_Free_Clipart_Picture_100404-002551-812053.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

# /images/:style/defaultavatar.jpg