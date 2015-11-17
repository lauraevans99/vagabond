class Comment < ActiveRecord::Base
	validates :body, presence: true
	validates :body, length: { in: 1..200 }
end
