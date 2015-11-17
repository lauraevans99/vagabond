class Post < ActiveRecord::Base
	belongs_to :cities
	belongs_to :users

	validates :title, :body, :user_id, presence: true
	validates :title, length: { in: 1..200 }

end
