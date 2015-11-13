class Post < ActiveRecord::Base
	belongs_to :cities
	belongs_to :users

end
