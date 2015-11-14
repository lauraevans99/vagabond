class AddAvatarsToUsers < ActiveRecord::Migration
 	def up
 		add_attachment :users, :AddAvatarsToUsers
 	end

 	def down
 		remove_attachment :users, :AddAvatarsToUsers
 	end


 end

